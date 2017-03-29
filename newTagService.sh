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
    valebroker-html)
        cd ~/$WS/valebroker-html
        echo -e "\e[32mAtualizando Tags e Branchs...\e[39m"
        git pull;
        ;;
    '')
        echo "Especifique o serviço"
        exit 1
        ;;
esac

branch_name="$(git symbolic-ref HEAD 2>/dev/null)" ||
branch_name="(unnamed branch)"     # detached HEAD

branch_name=${branch_name##refs/heads/}
project_name=${branch_name%%_*}

listTags=`git tag | grep $project_name | grep $1 | grep '^[a-z]*-[0-9]*.[0-9]*.[0-9]*-[a-z]*'`
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
            if [ $subversion -lt "${versionComplete[index]}" ]; then
                subversion=${versionComplete[index]}
            fi
        fi

        if [ $index = 2 ]; then
            if [ $num -lt "${versionComplete[index]}" ]; then
                num=${versionComplete[index]}
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

printf '%s\n' "`git tag | grep $project_name | grep $1 | grep '^[a-z]*-[0-9]*.[0-9]*.[0-9]*-[a-z]*'`"

echo -e "The new tag is: \e[94m$project_name-$version.$subversion.$num-$1\e[39m , Are you sure(y/n)? "
read -p "" -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]
then
    case $2 in
        backoffice)
            echo -e "\e[91mCriando tag corretora-core-front\e[39m"
            git tag $project_name-$version.$subversion.$num-$1
            git push --tags
            cd ~/$WS/corretora-core-back
            echo -e "\e[91mCriando tag corretora-core-back\e[39m"
            git tag $project_name-$version.$subversion.$num-$1
            git push --tags
            ;;
        homebroker)
            cd ~/$WS/valebroker-html-web
            echo -e "\e[91mCriando tag valebroker-html-web\e[39m"
            git tag $project_name-$version.$subversion.$num-$1
            git push --tags
            cd ~/$WS/valebroker-coldfusion
            echo -e "\e[91mCriando tag valebroker-coldfusion\e[39m"
            git tag $project_name-$version.$subversion.$num-$1
            git push --tags  

            echo -e "\e[93mPrecisa do valebroker-coldfusion-trusted?\e[39m"
            read -p "" -n 1 -r
            echo
            if [[ $REPLY =~ ^[Yy]$ ]]
            then
                cd ~/$WS/valebroker-coldfusion-trusted
                echo -e "\e[91mCriando tag valebroker-coldfusion-trusted\e[39m"
                git tag $project_name-$version.$subversion.$num-$1
                git push --tags 
            fi      

            echo -e "\e[93mPrecisa do portal-valemobi?\e[39m"
            read -p "" -n 1 -r
            echo
            if [[ $REPLY =~ ^[Yy]$ ]]
            then
                cd ~/$WS/portal-valemobi
                echo -e "\e[91mCriando tag portal-valemobi\e[39m"
                git tag $project_name-$version.$subversion.$num-$1
                git push --tags 
            fi                     
            ;;
        corretora-core-trusted)
            echo -e "\e[91mCriando tag corretora-core-trusted\e[39m"
            git tag $project_name-$version.$subversion.$num-$1
            git push --tags
            ;;
        valebroker-coldfusion-trusted)
            echo -e "\e[91mCriando tag valebroker-coldfusion\e[39m"
            git tag $project_name-$version.$subversion.$num-$1
            git push --tags
            cd ~/$WS/valebroker-coldfusion-trusted
            echo -e "\e[91mCriando tag valebroker-coldfusion-trusted\e[39m"
            git tag $project_name-$version.$subversion.$num-$1
            git push --tags

            echo -e "\e[93mPrecisa do portal-valemobi?\e[39m"
            read -p "" -n 1 -r
            echo
            if [[ $REPLY =~ ^[Yy]$ ]]
            then
                cd ~/$WS/portal-valemobi
                echo -e "\e[91mCriando tag portal-valemobi\e[39m"
                git tag $project_name-$version.$subversion.$num-$1
                git push --tags 
            fi                     
            ;;
        portal)
            echo -e "\e[91mCriando tag portal\e[39m"
            git tag $project_name-$version.$subversion.$num-$1
            git push --tags
            ;;
        portal-valemobi)
            echo -e "\e[91mCriando tag valebroker-coldfusion\e[39m"
            git tag $project_name-$version.$subversion.$num-$1
            git push --tags
            cd ~/$WS/portal-valemobi
            echo -e "\e[91mCriando tag portal-valemobi\e[39m"
            git tag $project_name-$version.$subversion.$num-$1
            git push --tags

            echo -e "\e[93mPrecisa do valebroker-coldfusion-trusted?\e[39m"
            read -p "" -n 1 -r
            echo
            if [[ $REPLY =~ ^[Yy]$ ]]
            then
                cd ~/$WS/valebroker-coldfusion-trusted
                echo -e "\e[91mCriando tag valebroker-coldfusion-trusted\e[39m"
                git tag $project_name-$version.$subversion.$num-$1
                git push --tags 
            fi 
            ;;
        valebroker-html)
            echo -e "\e[91mCriando tag valebroker-html\e[39m"
            git tag $project_name-$version.$subversion.$num-$1
            git push --tags
            ;;  
    esac
fi

