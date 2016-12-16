#!/bin/bash

cd ~/Workspace

for var in "$@"
do
    cd ~/Workspace/$var
    git status
done