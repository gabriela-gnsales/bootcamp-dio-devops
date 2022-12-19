## Kubernetes (K8s)
* ferramenta open source de orquestração de contêineres, originalmente desenvolvida pelo Google
* produto utilizado para automatizar a implantação, o dimensionamento e o
gerenciamento de aplicativos em contêiner
* ajuda a organizar e administrar aplicações em contêineres em ambientes onde existem dezenas
e até milhares de contêineres; as aplicações podem estar em diferentes ambientes de implementação:
    * infraestrutura local
    * máquinas virtuais
    * cloud pública
    * cloud híbrida

> __Qual a necessidade de uma ferramenta de orquestração de contêineres?__
> * migração de aplicações monolíticas para microsserviços
> * disponibilidade da aplicação (diminuição do downtime)
> * escalabilidade e alta performance
> * recuperação de desastre (Backup/Restore)

#### Cluster Kubernetes
* conjunto de servidores de processamento, chamados nós, que executam aplicações em contêineres
* conjunto de máquinas usadas para executar aplicações em contêineres → quando você executa o Kubernetes, está executando um cluster
* no mínimo, um cluster contém um plano de controle e pelo menos uma máquina ou nó
* todo cluster possui ao menos um servidor de processamento (worker node)

> * o servidor de processamento (worker) hospeda os __Pods__, que são componentes de uma aplicação
> * o ambiente de gerenciamento gerencia os nós de processamento e os Pods no cluster
> * em ambientes de produção, o ambiente de gerenciamento é geralmente executado em múltiplos computadores, provendo tolerância a falhas e alta disponibilidade

Os componentes da camada de gerenciamento tomam decisões globais sobre o cluster, bem como detectam e respondem aos eventos do cluster.

Os componentes da camada de gerenciamento podem ser executados em qualquer máquina do cluster. Contudo, para simplificar, os scripts de configuração normalmente iniciam todos os componentes da camada de gerenciamento na mesma máquina.

__Componentes da camada de gerenciamento:__
* kube apiserver
    * o servidor de API do K8s valida e configura dados para os objetos presentes no cluster, que incluem Pods, serviços,controladores de replicação e outros
    * o API Server atende às operações e fornece o frontend para o estado compartilhado do cluster por meio do qual todos os outros componentes interagem
* etcd
    * etcd é um armazenamento de valor em cluster
    * ele ajuda a viabilizar atualizações automáticas mais seguras, coordena a programação de trabalhos em hosts e ajuda a configurar redes de sobreposição para contêineres
    * é um componente importante de vários outros projetos, se destaca por ser o armazenamento de dados principal do K8s 
* kube scheduler
    * kube scheduler é um processo que atribui Pods a nós
    * ele determina quais nós são os posicionamentos válidos para cada Pod na fila de agendamento de acordo com as restrições e os recursos disponíveis
    * o kube scheduler então classifica cada Node válido e vincula o Pod a um Node adequado
* kube controller manager
    * um controlador é um loop que observa o estado compartilhado do cluster por meio do kube apiserver e faz alterações tentando mover o estado atual para o estado desejado

__Administração da camada de gerenciamento:__
* kubeadm: o comando para criar o cluster
* kubelet: o componente que executa em todas as máquinas no seu cluster e
cuida de tarefas como a inicialização de Pods e contêineres
* kubectl: a ferramenta de linha de comando para interação com o cluster

#### Pod
* conjunto de um ou mais contêineres de aplicativos (como Docker), que inclui armazenamento compartilhado (volumes), endereço IP e informações sobre como executá-los
* menor unidade do Kubernetes
* uma abstração sobre o contêiner
* normalmente é executada uma aplicação por Pod
→ os contêineres são agrupados nesses Pods para que os recursos sejam compartilhados de modo mais inteligente

#### Minikube
* utilitário que pode ser usado para executar o K8s em uma máquina local
* cria um cluster de nó único contido em uma máquina virtual (VM) → esse cluster permite executar e estudar o K8s sem exigir a sua instalação completa
* pré-requisitos para utilizar o Minikube:
    * software de virtualização previamente instalado
    * 2 CPUs ou mais
    * 2GB de memória RAM
    * 20GB de espaço em disco
    * conexão com a internet
Site de download: https://minikube.sigs.k8s.io/docs/start/

comando é utilizado para iniciar o Minikube - minikube start
#### kubectl
* ferramenta de linha de comando do K8s
* permite executar comandos em clusters do K8s
* usada para implantar aplicativos, inspecionar e gerenciar recursos de cluster e visualizar logs
Site de download: https://kubernetes.io/docs/tasks/tools/
__Comandos:__
* `kubectl get services`
* `kubectl get pods` ou `kubectl get pod` → visualizar os Pods em execução em um cluster K8s
    * `-o wide` → flag para ter informações adicionais do Pod
* `kubectl apply -f <nome arquivo>` → implementar / criar um Pod a partir de um arquivo YAML
    * `-f <nome arquivo>` ou `--filename=<nome arquivo>` → flag para indicar o nome do arquivo
* `kubectl delete pod <nome>` → deletar Pod
* `kubectl get nodes` ou `kubectl get node`
* `kubectl get deployment`
* `kubectl describe node <nome>` → saber as características do nó
* `kubectl scale deployment <nome> --replicas=<quantidade>` → aumentar a quantidade de Pods disponíveis em um determinado deployment; escalar a aplicação
* `kubectl expose deployment <nome> --type=LoadBalancer --name=app-html --port=80` → expor um deployment com o nome de app-html, no formato de load balancer e utilizando a porta 80
    * em caso de estar usando o minikube: `minikube service --url <nome app>` → obter o IP e a porta que serão utilizados internamente (na própria máquina)


__deployment__ → usado para criar réplicas de um Pod específico

#### Amazon Elastic Kubernetes Service (Amazon EKS)
* serviço gerenciado de K8s que descarta a necessidade de instalar e operar a camada de gerenciamento do cluster
* é certificado como compatível com o K8s, portanto, é possível migrar qualquer aplicativo com facilidade para o EKS

__Serviços similares ao EKS:__
* GCP Kubernetes Engine (GKE)
* Azure Kubernetes Service (AKS)

***

* service = tipo de serviço criado e vinculado a um pod com um banco de dados para realizar uma conexão com este banco via código
* LoadBalancer = tipo de serviço no K8s que gera um ip fixo para acesso a um deployment
* `kubectl port-forward pod/bd-mysql 3306:3306` = comando utilizado no K8s para o encaminhamento da porta 3306 no cluster para a porta 3306 em Pod com o nome de bd-mysql
* `kubectl exec` = comando utilizado para executar aplicações em um Pod

***

#### Persistência de dados em clusters K8s
O K8s possui 2 APIs:
* __PersistentVolume (PV):__
    * plugins de volume
    * tem um ciclo de vida independente de qualquer Pod que utilize um PV
    * tem por objetivo mostrar os detalhes da implementação do armazenamento, seja ele NFS, iSCSI ou um armazenamento específico de um provedor de cloud pública
* __PersistentVolumeClaim (PVC):__
    * requisição para armazenamento por um usuário
    * claims podem solicitar ao PV tamanho e modos de acesso específicos
    * uma reivindicação de volume pesistente (PVC) é a solicitação de armazenamento que é atendida vinculando a PVC a um volume persistente (PV) 
* Meios de acesso:
    * __ReadWriteOnce:__ o volume pode ser montado como leitura-gravação por um único nó
    * __ReadOnlyMany:__ o volume pode ser montado somente para leitura por muitos nós
    * __ReadWriteMany:__ o volume pode ser montado como leitura-gravação por muitos nós
* NFS: serviço que possibilita o compartilhamento de arquivos entre máquinas remotas através de uma rede; neste sistema usa-se o Modelo Cliente Servidor

