listTags=`git tag | grep $1 | grep '^[a-z]*-[0-9]*.[0-9]*.[0-9]*-[a-z]*'`
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

echo "$version.$subversion.$((num+1))"