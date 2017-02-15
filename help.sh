echo "Viariáveis de ambiente"
echo "-------------------------------------------------------------------------------------"
echo "$WS"
echo "$base"
echo
echo "Shortcuts"
echo "cd + abreviação do projeto | Ex: cdp = vai para o diretório do portal"
echo "i + abreviação do projeto | Ex: ip = clona o proejto do portal do git"
echo 
echo "Abreviações: "
echo "corretora-core-back           : ccb"
echo "corretora-core-front          : ccf"
echo "corretora-core-trusted        : cct"
echo "portal-valemobi               : pv"
echo "portal                        : p"
echo "valebroker-coldfusion         : vc"
echo "valebroker-coldfusion-trusted : vct"
echo "valebroker-flex-extras        : vfe"
echo "valebroker-flex-web           : vfw"
echo "valebroker-html               : vh"
echo "valebroker-html-web           : vhw"

WS=Workspace
base=core

alias cdw='cd ~/$WS'

alias cdccb='cd ~/$WS/corretora-core-back'
alias cdccf='cd ~/$WS/corretora-core-front'
alias cdcct='cd ~/$WS/corretora-core-trusted'
alias cdpv='cd ~/$WS/portal-valemobi'
alias cdp='cd ~/$WS/portal'
alias cdvc='cd ~/$WS/valebroker-coldfusion'
alias cdvct='cd ~/$WS/valebroker-coldfusion-trusted'
alias cdvfe='cd ~/$WS/valebroker-flex-extras'
alias cdvfw='cd ~/$WS/valebroker-flex-web'
alias cdvh='cd ~/$WS/valebroker-html'
alias cdvhw='cd ~/$WS/valebroker-html-web'

alias iccb='installp.sh corretora-core-back'
alias iccf='installp.sh corretora-core-front'
alias icct='installp.sh corretora-core-trusted'
alias ipv='installp.sh portal-valemobi'
alias ip='installp.sh portal'
alias ivc='installp.sh valebroker-coldfusion'
alias ivct='installp.sh valebroker-coldfusion-trusted'
alias ivfe='installp.sh valebroker-flex-extras'
alias ivfw='installp.sh valebroker-flex-web'
alias ivh='installp.sh valebroker-html'
alias ivhw='installp.sh valebroker-html-web'

alias createWorkspaceGuide='iccb && iccf && icct && ip && ivc && ivct && ivhw && ivh'
alias createWorkspaceAndBank='iccb && iccf && icct && ipv && ivc && ivct && ivhw'

alias letsgo='code ~/$WS && 1all'
alias scripts='code ~/MyScripts/Scripts/'
alias sql='code ~/Desktop/.Scripts'
alias d0='git checkout andbank_dev'
alias h0='git checkout andbank_homolog'
alias call='checkout.sh '
alias gc='git checkout '
alias b='git checkout -b '
alias bp='git push -u origin '
alias 1='git status'
alias 2='git add .'
alias 3='git commit -am'
alias 4='git pull'
alias 5='git push'
alias 6='git stash'
alias 7='git stash pop'
alias 8='git cherry-pick'
alias merge='git merge andbank_dev'
alias folders='find . -mindepth 1 -maxdepth 1 -not -path "*/\.*" -type d'
alias 1all='status.sh'
alias 4all='pull.sh'

alias editbash='code ~/.bashrc'
alias udpateRailo='docker pull beta-docker-registry.valebroker.com.br/software/railo'
alias ws='export WS=Workspace && cdw'
alias ws2='export WS=Workspace2 && cdw'
alias ws3='export WS=Workspace3 && cdw'
alias ws4='export WS=Workspace4 && cdw'
alias baseGuide='export base=core'
alias baseAndBank='export base=coreAndBank'
alias sapo2='sapo up $base --inmemory 201.20.12.171'
alias todo='code ~/Desktop/TODO.todo'
alias utils='code ~/Desktop/Utils.txt'
