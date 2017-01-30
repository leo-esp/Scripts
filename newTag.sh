lastTag=`git tag | grep $1 | tail -1`
numTag=${lastTag##*.}
tag=${numTag%-*}
next=$(($tag + 1))
echo "${lastTag/$tag/$next}"