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

case $2 in
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

printf '%s\n' "`git tag | grep $1 | grep '^[a-z]*-[0-9]*.[0-9]*.[0-9]*-[a-z]*'`"

read -p "The new tag is: $project_name-$version.$subversion.$num-$1, Are you sure? " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]
then
    git tag $project_name-$version.$subversion.$num-$1
    git push --tags
fi
