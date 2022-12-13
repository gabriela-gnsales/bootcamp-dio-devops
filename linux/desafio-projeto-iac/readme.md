# Desafio de projeto

### Infraestrutura como Código: Script de Criação de Estrutura de Usuários, Diretórios e Permissões

### O que é?
__Infraestrutura como Código (IaC)__ é o gerenciamento e provisionamento da infraestrutura por meio de códigos, em vez de processos manuais. Com a IaC, são criados arquivos de configuração que incluem as especificações da sua infraestrutura, facilitando a edição e a distribuição de configurações. Ela também assegura o provisionamento do mesmo ambiente todas as vezes.

### Controle de versão
O controle de versão é uma parte importante da IaC. Os arquivos de configuração devem pertencer à fonte como qualquer outro código-fonte de software. Ao implantar a infraestrutura como código, também é possível separá-la em módulos, que podem ser combinados de diferentes maneiras por meio da automação.

### Principal benefício
Ao automatizar o provisionamento da infraestrutura com a IaC, os desenvolvedores não precisam provisionar e gerenciar manualmente servidores, sistemas operacionais, armazenamento e outros componentes de infraestrutura sempre que criam ou implantam uma aplicação.

## Definições
* Excluir diretórios, arquivos, grupos e usuários criados anteriormente;
* Todo provisionamento deve ser feito em um arquivo do tipo Bash Script;
* O dono de todos os diretórios criados será o usuário root;
* Todos os usuários terão permissão total dentro do diretório publico;
* Os usuários de cada grupo terão permissão total dentro de seu respectivo diretório;
* Os usuários não poderão ter permissão de leitura, escrita e execução em diretórios de departamentos que eles não pertencem;
* Subir arquivo de script criado para a sua conta no GitHub.

![Desafio de projeto](/linux/desafio-projeto-iac/desafio.png)