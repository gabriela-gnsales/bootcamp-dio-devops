#### Modelo Cliente Servidor
O modelo cliente servidor é uma estrutura de aplicação que distribui as tarefas e cargas de trabalho entre os fornecedores de um recurso ou serviço, designados como servidores, e os requerentes dos serviços, designados como clientes.

#### Cloud
A cloud computing é o acesso sob demanda, via internet, a recursos de computação aplicativos, servidores (físicos e virtuais), armazenamento de dados, ferramentas de desenvolvimento, recursos de rede e muito mais, hospedados em um data center remoto gerenciado por um provedor de serviços em cloud (Cloud Solution Provider). O CSP disponibiliza esses recursos por uma assinatura mensal ou por um valor cobrado conforme o uso.

#### Virtualização
A virtualização utiliza software para criar uma camada de abstração sobre o hardware do computador, permitindo que os recursos de hardware de um único computador (processadores, memória, armazenamento, etc) sejam divididos em vários computadores virtuais.

#### Microsserviços
Microsserviços são uma abordagem arquitetônica e organizacional do desenvolvimento de software na qual o software consiste em pequenos serviços independentes que se comunicam usando APIs bem definidas. Esses serviços pertencem a pequenas equipes autossuficientes.
As arquiteturas de microsserviços facilitam a escalabilidade e agilizam o desenvolvimento de aplicativos, habilitando a inovação e acelerando o tempo de introdução de novos recursos no mercado.

#### Contêineres
Os contêineres são uma tecnologia usada para reunir um aplicativo e todos os seus arquivos necessários em um ambiente de tempo de execução. Como uma unidade, o contêiner pode ser facilmente movido e executado em
qualquer sistema operacional, em qualquer contexto.

#### Docker
Com o Docker é possível lidar com os contêineres como se fossem máquinas
virtuais modulares e extremamente leves. Além disso, os contêineres oferecem maior flexibilidade para você criar, implantar, copiar e migrar um contêiner de um ambiente para outro. Isso otimiza as aplicações em nuvem (privada e pública).

> __Diferença entre virtualização e contêineres__
As duas tecnologias são distintas porém complementares. Veja uma maneira fácil de distinguir ambas:
>* Com a virtualização é possível executar sistemas operacionais (Windows ou Linux) simultaneamente em um único sistema de hardware.
>* Os contêineres compartilham o mesmo kernel do sistema operacional e isolam os processos da aplicação do restante do sistema. Os contêineres Linux são extremamente portáteis, mas devem ser compatíveis com o sistema subjacente.

***

#### Comandos Docker
* `docker version`
* `docker --help`
* `docker pull <image>` → baixar uma imagem
    * `docker pull <image:tag>` → para especificar a tag / versão
        * ex: `docker pull debian:9`
* `docker images`
* `docker run <image>` → executar um contêiner (SINTAXE ANTIGA)
    * `i` → flag para acionar o modo iterativo no contêiner
    * `t` ou `--tty` → flag para alocar um pseudo terminal para trabalhar
    * `name` → flag para indicar o nome do contêiner
    * `d` → flag para executar contêiner em background (continua em execução mesmo após sair do contêiner) e printa o ID
        * ex: `docker run -dti --name Ubuntu-A ubuntu` 
    * `p` → flag para especificar qual porta será publicado para acesso via host / máquina física; referenciar as portas utilizadas pelo contêiner
    * `e` → flag para setar as variáveis de ambiente
        * ex: `docker run -e MYSQL_ROOT_PASSWORD=Senha123 --name mysql-A -d -p 3306:3306 mysql`
    * `u` → flag para especificar usuário (ex: `-u root`)
    * `protocol` → flag para especificar protocolo (ex: `--protocol=tcp`)
* `docker container run <image>` → executar um contêiner (SINTAXE NOVA)
* `docker run <image> sleep <nº segundos>`
* `docker ps` → listar os contêineres em execução (SINTAXE ANTIGA)
* `docker container ls` → listar os contêineres em execução (SINTAXE NOVA)
* `docker ps -a` → listar os contêineres executados recentemente 
* `docker exec -it <nome ou ID do contêiner> <nome do que será executado` → executar aplicações no contêiner
    * ex: `docker exec -it 388 /bin/bash`
*  `exit` → sair do contêiner
* `docker stop <nome ou ID do contêiner>` → parar contêiner
* `docker start <nome ou ID do contêiner>` → reiniciar execução do contêiner
* `docker rm <nome ou ID do contêiner>` → excluir contêiner
* `docker rmi <nome da imagem>` → excluir imagens
* `docker inspect <nome ou ID do contêiner>` → receber informações detalhadas sobre um contêiner em execução

##### Tipos de mount (volume de dados ou montagens para dados persistentes)
`--volume=<local do host>:<local do contêiner>` → recuperar dados
`docker volume prune` → limpar todos os volumes
* __Bind mounts:__ usado basicamente para vincular um determinado diretório ou arquivo host dentro do contêiner
    * ex: `docker run -v /hostdir:/containerdir mysql`
* __Named volumes:__ volumes criados manualmente com o comando `docker volume create <nome do volume>`; eles são criados em `/var/lib/docker/volumes` e podem ser referenciados apenas por seu nome
    * ex: `docker run -v mysql_data:containerdir mysql`
* __Dockerfile volumes:__ volumes criados pela instrução VOLUME; também são criados em `/var/lib/docker/volumes`, mas não têm um nome determinado; é criado ao executar o contêiner e são úteis para salvar dados persistentes

_RECOMENDAÇÃO:_ usar volumes, pois são criados e gerenciados pelo docker

> __Exemplos de tipos de mount__
> * Bind
>   * `docker run -dti --mount type=bind,src=/opt/teste,dst=/teste debian`
>   * `docker run -dti --mount type=bind,src=/opt/teste,dst=/teste,ro debian`
> * Volumes
> ```
>       docker volume create teste
>       docker volume ls
>           /var/lib/docker/volumes/teste/_data
>       docker run -dti --mount type=volume,src=teste,dst=teste debian
>       docker volume rm teste
>```

> __Exemplos contêiner__
> * Apache
>   * `docker run  --name apache-A -d -p 80:80 --volume=/data/apache-A:/usr/local/apache2/htdocs/ httpd`
> * PHP - Apache
>   * `docker run  --name php-A -d -p 8080:80 --volume=/data/php-A:/var/www/html php:7.4-apache`
