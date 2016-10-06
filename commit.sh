cd ~/Workspace

for var in "${@:2}"
do
    cd ~/Workspace/$var
    git commit -m "$1"
done