#### Kubernetes (K8s)
* ferramenta (open source) de orquestração de contêineres originalmente desenvolvida pelo Google
* produto Open Source utilizado para automatizar a implantação, o dimensionamento e o
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
* conjunto de nós que executam aplicativos em contêineres
* conjunto de máquinas usadas para executar aplicações em contêineres → quando você executa o Kubernetes, está executando um cluster
* no mínimo, um cluster contém um plano de controle e pelo menos uma máquina ou nó

#### Pod
* conjunto de um ou mais contêineres de aplicativos (como Docker), que inclui armazenamento compartilhado (volumes), endereço IP e informações sobre como executá-los
* menor unidade do Kubernetes
* uma abstração sobre o contêiner
* normalmente é executada uma aplicação por Pod
→ os contêineres são agrupados nesses pods para que os recursos sejam compartilhados de modo mais inteligente
