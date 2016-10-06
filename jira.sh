#!/bin/bash

cd ~/Workspace

for var in "${@:2}"
do
    cd ~/Workspace/$var
    git checkout andbank_dev
    git checkout -b andbank_ANDB-$1 
    git push --set-upstream origin andbank_ANDB-$1
done