cd ~/Workspace

for var in "${@:2}"
do
    cd ~/Workspace/$var
    git checkout $1
done