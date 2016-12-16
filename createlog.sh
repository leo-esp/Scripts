#!/bin/bash

cd ~/Workspace

for var in "$@"
do
    cd ~/Workspace/$var
    echo $pwd
    git log --stat --author=leo-esp > ~/Desktop/Logs/$var.log
done