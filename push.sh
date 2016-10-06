cd ~/Workspace

for var in "$@"
do
    cd ~/Workspace/$var
    git push
done