#!/bin/bash

cd ~/Workspace

for dir in ~/Workspace/*
do 
cd "$dir"
branch_name="$(git symbolic-ref HEAD 2>/dev/null)" ||
branch_name="(unnamed branch)"
branch_name=${branch_name##refs/heads/}
if [[ "$branch_name" == *"$1"* ]]; then
    foca $(git diff --name-only --diff-filter=d andbank_dev);
    sleep 0.5s;
fi
cd ~/Workspace
done

