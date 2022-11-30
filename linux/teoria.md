#### Sistema Operacional
É um software, ou conjunto de softwares, que tem a função de administrar e gerenciar os recursos (componentes de hardware, sistemas de arquivos, programas de terceiros...) de um sistema.
__Principal função:__ estabelecer uma interface entre o __hardware__ e o __usuário__.

#### Máquinas virtuais
São computadores de software com a mesma funcionalidade que os computadores físicos, executando aplicativos e um sistema operacional. No entanto, as máquinas virtuais são arquivos de computador executados em um computador físico e se comportam como um computador físico.

#### Modelo cliente-servidor
Estrutura de aplicação que distribui as tarefas e cargas de trabalho entre os fornecedores de um serviço ou recurso, designados como servidores, e os requerentes dos serviços, designados como clientes.

##### KERNEL
Ponte entre o usuário e o hardware, compõe a parte central do SO e responde por tarefas cruciais do sistema.

##### Acesso remoto a máquinas Linux
* __Putty:__ software utilizado para realizar o acesso remoto em um computador com o sistema operacional Linux a partir de um computador com o sistema operacional Windows
* __openssh:__ nome do serviço no Linux que possibilita o acesso remoto ao servidor através do protocolo ssh
* __`sudo apt install openssh-server`:__ comando utilizado para instalar o serviço openssh
* __`sshd_config`:__ arquivo de configuração do serviço de acesso remoto (openssh)
* __`ssh maria@192.168.100.10`:__ comando utilizado para realizar o acesso remoto a um servidor Linux com IP 192.168.100.10 e usuário Maria, a partir de outro computador com o sistema Linux

***
#### Comandos Linux
* __Case sensitive__
* `<nome usuário>@<nome máquina>:<diretório onde está><tipo usuário>` ; ex: `gabriela@DESKTOP-2EI54KA:~$`
* `~` = pasta do usuário
* `$` = usuário convencional / com restrições; `#` = super usuário / usuário root / com acesso total ao sistema
* `clear` ou atalho `Ctrl + L` = limpar a tela
* `sudo` = comando para invocar o usuário root
* `sudo su` = logar como usuário root
* `<comando> --help` = ajuda do comando 
* `man <comando>` = manual do comando
* `history` = armazena o histórico de comandos do usuário
* `!!` = repete o comando anterior 
* `pwd` = verificar qual diretório está (`/` é o diretório raiz)
* `cd` (change directory) = mudar de diretório
* `ls` = listar arquivos e diretórios
* `ls -l` = listar arquivos e diretórios um abaixo do outro e com mais informações (permissões...)
    * `<identificação e permissões arquivo/diretório> <quantidade de objetos que ele possui (no caso de diretórios)> <nome do usuário dono/responsável> < nome do grupo a que pertence> <tamanho em bytes> <data que foi criado ou operado a última vez> <nome arquivo/diretório>`
* `ls -lh` = formato humano → exibe os valores de tamanhos dos arquivos/diretórios em kB, MB...
* `ls -a` = listar arquivos e diretórios ocultos e não ocultos
* `ls | more` = visualizar uma lista grande em um ambiente sem barra de rolagem
* `find -name <nome arquivo>`: buscar arquivo dentro do diretório que está no momento
* __Comandos para filtrar:__
    * `|` = pipe - usado para filtrar
    * `grep <padrão buscado>` = buscar algum padrão
    * `*` = qualquer letra no final
    * `?` = qualquer letra no meio
    * `arquivo[1-4]*` = lista arquivos de 1 ATÉ 4 (ex: arquivo1.txt arquivo2.txt arquivo3.txt arquivo4.txt)
    * `arquivo[2,5]*` = lista arquivos 2 E 5 (ex: arquivo2.txt arquivo5.txt)
    * `arquivo[^2,5]*` = NÃO lista arquivos 2 e 5 (`^` = negação) 
* `touch <nome arquivo>.<extensão>` = criar arquivo 
* `cat <nome arquivo>.<extensão>` = visualizar conteúdo arquivo
* `mkdir <nome diretório>` = criar diretório 
    * usar aspas simples se o nome do arquivo ou diretório for separado por espaços; ex: 'Meus documentos'
* `rm <nome arquivo>.<extensão>` = excluir arquivo
* `rmdir <nome diretório>` = excluir diretório vazio
* `rm -rf <nome>` = excluir arquivo ou diretório (mesmo que não esteja vazio)
    * `r` = flag recursivo
    * `f` = flag forçar a execução
* `rm -rfvi <nome>` = excluir arquivo ou diretório com pergunta de confirmação

#### Identificação e permissões de arquivos e diretórios
* `d` = identificação diretório
* `-` = identificação arquivo
* `w` = permissão de escrita/gravação
* `x` = permissão de execução/abertura
* `r` = permissão de leitura
* `-` = permissão desabilitada
* 1º bloco = permissões do dono/usuário
* 2º bloco = permissões do grupo
* 3º bloco = permissões de outros usuários

#### Editores de texto
* `vim <nome arquivo>` - se o arquivo ainda não existir, será então criado
    * `i` = para começar a editar
    * `Esc` = para sair do modo de inserção/edição
    * `:wq!` = para salvar e sair
* `nano <nome arquivo>` - se o arquivo ainda não existir, será então criado
     * modo inserção fica ativo assim que o arquivo é aberto
     * `Ctrl + O` = para salvar
     * `Ctrl + X` = para sair

#### Grupos de usuários
* `/etc/group` = diretório onde estão listados os grupos
* `/etc/sudoers` = diretório onde estão listados os usuários com permissão de root

#### Trabalhando com usuários e grupos
* `useradd <nome usuário>` = adicionar usuário, sem informações de senha...
    * `-m` = flag para que os diretórios do usuário sejam criados dentro do diretório /home
    * `-c` = flag para cadastrar o nome completo do usuário
    * `-s` = flag para definir o shell (`/bin/bash`)
    * `-e` = flag para especificar a data de expiração da conta
    * `-p` = flag para encriptar a senha (`$(openssl passwd -crypt <senha>)`)
* `passwd <nome usuário>` = colocar a senha do usuário
* `userdel <nome usuário> -r -f` = deletar usuário e seus diretórios
* `usermod <nome usuário>` = fazer modificações nas configurações do usuário
* `cat /etc/passwd` = verificar quais usuários têm no sistema
* `usermod -g <nome grupo> <nome usuário>` = adicionar usuário a 1 grupo só (força ele sair do grupo que está atualmente e ir para outro)
* `usermod -G <nome grupo>, <nome outro grupo>... <nome usuário> ` = adicionar usuário a vários grupos
* `groupadd <nome grupo>` = adicionar grupo
* `groupdel <nome grupo>` = deletar grupo
* `chown <nome usuário>:<nome grupo> <nome arquivo/diretório>` = alterar usuário e grupo donos do arquivo/diretório
* `chmod <soma das permissões do usuário><soma das permissões do grupo><soma das permissões dos outros> <nome arquivo/diretório>` = alterar permissões do usuário, grupo e outros do arquivo/diretório; ex: `chmod 752 pasta`
    * leitura (r) = 4
    * gravação (w) = 2
    * execução (x) = 1
    * nenhuma = 0

#### Gerenciamento de pacotes
`apt-get` = gerenciador mais baixo nível (do sistema), não muito amigável com o usuário, não passa muitas informações, usado para, por exemplo, instalar aplicativos que serão usados no servidor
`apt` = gerenciador mais moderno, tem uma interação mais amigável, usado para, por exemplo, para saber se tem algo que precisa atualizar, para fazer buscas
`apt list` = verificar quais pacotes há disponíveis no sistema para baixar
`apt list --installed` = verificar quais pacotes estão instalados na máquina atualmente
`apt list --upgradable` = verificar se há atualizações a serem feitas
`apt search <nome pacote/aplicação>` = buscar pacote/aplicação
`apt install <nome arquivo>` = instalar arquivo
`apt remove <nome arquivo>` = desinstalar/remover arquivo

#### Compactar / descompactar arquivos
`unzip <nome arquivo>` = descompactar arquivo 

***

`ifconfig` = verificar o IP da máquina, disponível no pacote `net-tools`
