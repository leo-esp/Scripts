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
alias cdvm='cd ~/$WS/vm2020-front-html'
alias cdpm='cd ~/$WS/portfolioManager'

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
alias ivm='installp.sh vm2020-front-html'
alias ipm="installp.sh portfolioManager"

alias scripts='code ~/MyScripts/Scripts/'
alias sql='code ~/Desktop/.Scripts'
alias gcall='checkout.sh '
alias gc='git checkout '
alias 1='git status'
alias 2='git add .'
alias 3='git commit -am'
alias 4='git pull'
alias 5='git push'
alias 6='git stash'
alias 7='git stash pop'
alias 8='git cherry-pick'
alias folders='find . -mindepth 1 -maxdepth 1 -not -path "*/\.*" -type d'
alias 1all='status.sh'
alias 4all='pull.sh'
alias p='pullRequestUnique.sh '
alias nt='newTagService.sh'
alias wb='whichBranch.sh'

alias vctlog='docker exec -it sapo_valebroker-coldfusion-trusted_1 tail -f -n 400 /opt/www/application/WEB-INF/railo/logs/exception.log'
alias backlog='docker exec -it sapo_backoffice_1 tail -f -n 400 /opt/www/application/WEB-INF/railo/logs/exception.log'
alias portallog='docker exec -it sapo_portal-valemobi_1 tail -f -n 400 /opt/www/application/WEB-INF/railo/logs/exception.log'
alias cctlog='docker exec -it sapo_corretora-core-trusted_1 tail -f -n 400 /opt/www/application/WEB-INF/railo/logs/exception.log'
alias hblog='docker exec -it sapo_homebroker_1 tail -f -n 400 /opt/www/application/WEB-INF/railo/logs/exception.log'

alias vctjson='docker exec -it sapo_valebroker-coldfusion-trusted_1 tail -f -n 400 /opt/www/application/WEB-INF/railo/logs/hg_json.log'
alias backjson='docker exec -it sapo_backoffice_1 tail -f -n 400 /opt/www/application/WEB-INF/railo/logs/hg_json.log'
alias portaljson='docker exec -it sapo_portal-valemobi_1 tail -f -n 400 /opt/www/application/WEB-INF/railo/logs/hg_json.log'
alias cctjson='docker exec -it sapo_corretora-core-trusted_1 tail -f -n 400 /opt/www/application/WEB-INF/railo/logs/hg_json.log'
alias hbjson='docker exec -it sapo_homebroker_1 tail -f -n 400 /opt/www/application/WEB-INF/railo/logs/hg_json.log'

alias vctquery='docker exec -it sapo_valebroker-coldfusion-trusted_1 tail -f -n 400 /opt/www/application/WEB-INF/railo/logs/hg_query.log'
alias backquery='docker exec -it sapo_backoffice_1 tail -f -n 400 /opt/www/application/WEB-INF/railo/logs/hg_query.log'
alias portalquery='docker exec -it sapo_portal-valemobi_1 tail -f -n 400 /opt/www/application/WEB-INF/railo/logs/hg_query.log'
alias cctquery='docker exec -it sapo_corretora-core-trusted_1 tail -f -n 400 /opt/www/application/WEB-INF/railo/logs/hg_query.log'
alias hbquery='docker exec -it sapo_homebroker_1 tail -f -n 400 /opt/www/application/WEB-INF/railo/logs/hg_query.log'

alias editbash='code ~/.bashrc'
alias updateRailo='docker pull beta-docker-registry.valebroker.com.br/software/railo'
alias ws='export WS=Workspace && cdw'
alias ws2='export WS=Workspace2 && cdw'
alias ws3='export WS=Workspace3 && cdw'
alias ws4='export WS=Workspace4 && cdw'
alias baseGuide='export base=core'
alias baseAndBank='export base=coreAndBank'
alias todo='code ~/Desktop/TODO.todo'
alias utils='code ~/Desktop/Utils.txt'
alias sqlutils='code ~/Desktop/SqlUtils.sql'
alias fundCache='cache.sh'
alias hbDev="sed -i 's/443/80/g' ~/$WS/valebroker-html-web/configuration.cfm && sed -i 's/https/http/g' ~/$WS/valebroker-html-web/configuration.cfm && sed -i 's/443/80/g' ~/$WS/valebroker-html-web/configuration-template.cfm && sed -i 's/https/http/g' ~/$WS/valebroker-html-web/configuration-template.cfm"
# vmobi#212