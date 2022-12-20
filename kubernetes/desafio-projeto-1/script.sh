#!/bin/bash

echo "Criando as imagens..."

docker build -t gabrielagns/projeto-backend:1.0 backend/.
docker build -t gabrielagns/projeto-database:1.0 database/.

echo "Realizando o push das imagens..."

docker push gabrielagns/projeto-backend:1.0
docker push gabrielagns/projeto-database:1.0 

echo "Criando serviços no cluster kubernetes..."

kubectl apply -f ./services.yml

echo "Criando os deployments..."

kubectl apply -f ./deployment.yml