
checkProd() {
    if [ $1 == 'prod' ] || [ $1 == 'beta' ]; then
        printf "\n\nService: $2" >> ~/$WS/projectTags.txt
        printf "\nImagem: docker-registry.valebroker.com.br/valemobi/$2:$3\n" >> ~/$WS/projectTags.txt
    else
        printf "\n$2: $3" >> ~/$WS/projectTags.txt
    fi
}

WS=`basename $PWD`
case $2 in
    backoffice)
        cd ~/$WS/corretora-core-front
        echo -e "\e[32mAtualizando Tags e Branchs...\e[39m"
        git pull;
        ;;
    homebroker)
        cd ~/$WS/valebroker-coldfusion
        echo -e "\e[32mAtualizando Tags e Branchs...\e[39m"
        git pull;
        ;;
    corretora-core-trusted)
        cd ~/$WS/corretora-core-trusted
        echo -e "\e[32mAtualizando Tags e Branchs...\e[39m"
        git pull;
        ;;
    valebroker-coldfusion-trusted)
        cd ~/$WS/valebroker-coldfusion
        echo -e "\e[32mAtualizando Tags e Branchs...\e[39m"
        git pull;
        ;;
    portal)
        cd ~/$WS/portal
        echo -e "\e[32mAtualizando Tags e Branchs...\e[39m"
        git pull;
        ;;
    portal-valemobi)
        cd ~/$WS/valebroker-coldfusion
        echo -e "\e[32mAtualizando Tags e Branchs...\e[39m"
        git pull;
        ;;   
    tradesystem)
        cd ~/$WS/valebroker-html
        echo -e "\e[32mAtualizando Tags e Branchs...\e[39m"
        git pull;
        ;;
    tesouraria)
        cd ~/$WS/vm2020-front-html
        echo -e "\e[32mAtualizando Tags e Branchs...\e[39m"
        git pull;
        ;;
    '')
        echo "Especifique o serviço"
        exit 1
        ;;
esac

directory=`basename $PWD`

branch_name="$(git symbolic-ref HEAD 2>/dev/null)" ||
branch_name="(unnamed branch)"     # detached HEAD

branch_name=${branch_name##refs/heads/}
project_name=${branch_name%%_*}

if [ $project_name == "master" ]; then
    project_name='guide'
fi

listTags=`git tag | grep $project_name | grep $1 | grep '^[a-z]*-[0-9]*\.[0-9]*\.[0-9]*-[a-z]*' | sort --version-sort`
version=0
subversion=0
num=0

for tag in $listTags; do
    numtag=${tag#*-}
    IFS='.' read -r -a versionComplete <<< "${numtag%-*}"
    for index in "${!versionComplete[@]}"
    do
        if [ $index = 0 ]; then
            if [ $((version)) -lt "${versionComplete[index]}" ]; then
                version=${versionComplete[index]}
            fi
        fi

        if [ $index = 1 ]; then
            if [ $subversion -lt "${versionComplete[index]}" ] && [ "${versionComplete[0]} == $((version))" ]; then
                subversion=${versionComplete[index]}
            fi
        fi

        if [ $index = 2 ]; then
            if [ $num -lt "${versionComplete[index]}" ] && [ "${versionComplete[0]} == $((version))" ] && [ "${versionComplete[1]} == $((subversion))" ]; then
                num=${versionComplete[index]}
            else
                num=0
            fi
        fi
    done
done

case $3 in
    v)
        version=$((version+1))
        subversion=0
        num=0 
        ;;
    m)
        subversion=$((subversion+1))
        num=0        
        ;;
    '')
        num=$((num+1))
        ;;
esac

if [ $((version)) = 0 ]; then
    version=1
    subversion=0
    num=0
fi

printf '%s\n' "`git tag | grep $project_name | grep $1 | grep '^[a-z]*-[0-9]*\.[0-9]*\.[0-9]*-[a-z]*' | sort --version-sort`"
lastTag=`git tag | grep $project_name | grep $1 | grep '^[a-z]*-[0-9]*\.[0-9]*\.[0-9]*-[a-z]*' | sort --version-sort | tail -1`
echo
echo $lastTag
echo
echo -e "The new tag is: $directory: \e[96m$project_name-$version.$subversion.$num-$1\e[39m , Are you sure(y/n)? "
read -p "" -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]
then
    case $2 in
        backoffice)
            echo -e "\e[91mCriando tag corretora-core-front\e[39m"
            git tag $project_name-$version.$subversion.$num-$1
            git push origin $project_name-$version.$subversion.$num-$1
            cd ~/$WS/corretora-core-back
            git pull
            echo -e "\e[91mCriando tag corretora-core-back\e[39m"
            git tag $project_name-$version.$subversion.$num-$1
            git push origin $project_name-$version.$subversion.$num-$1
            checkProd $1 'corretora-core-web' $project_name-$version.$subversion.$num-$1
            ;;
        homebroker)
            cd ~/$WS/valebroker-html-web
            git pull
            echo -e "\e[91mCriando tag valebroker-html-web\e[39m"
            git tag $project_name-$version.$subversion.$num-$1
            git push origin $project_name-$version.$subversion.$num-$1
            cd ~/$WS/valebroker-coldfusion
            git pull
            echo -e "\e[91mCriando tag valebroker-coldfusion\e[39m"
            git tag $project_name-$version.$subversion.$num-$1
            git push origin $project_name-$version.$subversion.$num-$1  
            checkProd $1 $2 $project_name-$version.$subversion.$num-$1  

            echo -e "\e[93mPrecisa do valebroker-coldfusion-trusted?\e[39m"
            read -p "" -n 1 -r
            echo
            if [[ $REPLY =~ ^[Yy]$ ]]
            then
                cd ~/$WS/valebroker-coldfusion-trusted
                git pull
                echo -e "\e[91mCriando tag valebroker-coldfusion-trusted\e[39m"
                git tag $project_name-$version.$subversion.$num-$1
                git push origin $project_name-$version.$subversion.$num-$1 
                checkProd $1 'valebroker-coldfusion-trusted' $project_name-$version.$subversion.$num-$1  
            fi

            echo -e "\e[93mPrecisa do portal-valemobi?\e[39m"
            read -p "" -n 1 -r
            echo
            if [[ $REPLY =~ ^[Yy]$ ]]
            then
                cd ~/$WS/portal-valemobi
                git pull
                echo -e "\e[91mCriando tag portal-valemobi\e[39m"
                git tag $project_name-$version.$subversion.$num-$1
                git push origin $project_name-$version.$subversion.$num-$1 
                checkProd $1 $2 $project_name-$version.$subversion.$num-$1  
            fi                     
            ;;
        corretora-core-trusted)
            echo -e "\e[91mCriando tag corretora-core-trusted\e[39m"
            git tag $project_name-$version.$subversion.$num-$1
            git push origin $project_name-$version.$subversion.$num-$1
            checkProd $1 $2 $project_name-$version.$subversion.$num-$1  
            ;;
        valebroker-coldfusion-trusted)
            echo -e "\e[91mCriando tag valebroker-coldfusion\e[39m"
            git tag $project_name-$version.$subversion.$num-$1
            git push origin $project_name-$version.$subversion.$num-$1
            cd ~/$WS/valebroker-coldfusion-trusted
            git pull
            echo -e "\e[91mCriando tag valebroker-coldfusion-trusted\e[39m"
            git tag $project_name-$version.$subversion.$num-$1
            git push origin $project_name-$version.$subversion.$num-$1
            checkProd $1 $2 $project_name-$version.$subversion.$num-$1  

            echo -e "\e[93mPrecisa do portal-valemobi?\e[39m"
            read -p "" -n 1 -r
            echo
            if [[ $REPLY =~ ^[Yy]$ ]]
            then
                cd ~/$WS/portal-valemobi
                git pull
                echo -e "\e[91mCriando tag portal-valemobi\e[39m"
                git tag $project_name-$version.$subversion.$num-$1
                git push origin $project_name-$version.$subversion.$num-$1 
                checkProd $1 $2 $project_name-$version.$subversion.$num-$1  
            fi                     
            ;;
        portal)
            echo -e "\e[91mCriando tag portal\e[39m"
            git tag $project_name-$version.$subversion.$num-$1
            git push origin $project_name-$version.$subversion.$num-$1
            checkProd $1 $2 $project_name-$version.$subversion.$num-$1  
            ;;
        portal-valemobi)
            echo -e "\e[91mCriando tag valebroker-coldfusion\e[39m"
            git tag $project_name-$version.$subversion.$num-$1
            git push origin $project_name-$version.$subversion.$num-$1
            cd ~/$WS/portal-valemobi
            git pull
            echo -e "\e[91mCriando tag portal-valemobi\e[39m"
            git tag $project_name-$version.$subversion.$num-$1
            git push origin $project_name-$version.$subversion.$num-$1
            checkProd $1 $2 $project_name-$version.$subversion.$num-$1  

            echo -e "\e[93mPrecisa do valebroker-coldfusion-trusted?\e[39m"
            read -p "" -n 1 -r
            echo
            if [[ $REPLY =~ ^[Yy]$ ]]
            then
                cd ~/$WS/valebroker-coldfusion-trusted
                git pull
                echo -e "\e[91mCriando tag valebroker-coldfusion-trusted\e[39m"
                git tag $project_name-$version.$subversion.$num-$1
                git push origin $project_name-$version.$subversion.$num-$1 
                checkProd $1 $2 $project_name-$version.$subversion.$num-$1  
            fi 
            ;;
        tradesystem)
            echo -e "\e[91mCriando tag valebroker-html\e[39m"
            git tag $project_name-$version.$subversion.$num-$1
            git push origin $project_name-$version.$subversion.$num-$1
            checkProd $1 $2 $project_name-$version.$subversion.$num-$1  
            ;; 
        tesouraria)
            echo -e "\e[91mCriando tag vm2020-front-html\e[39m"
            git tag $project_name-$version.$subversion.$num-$1
            git push origin $project_name-$version.$subversion.$num-$1
            checkProd $1 $2 $project_name-$version.$subversion.$num-$1  
            echo -e "\e[1;104;103mVerificar se precisa do homebroker\e[0;49;39m"
            ;;
    esac
fi
