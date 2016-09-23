#!/bin/bash
array=( $(find . -mindepth 1 -maxdepth 1 -not -path '*/\.*' -type d) )

# loop over it
for i in ${array[@]}
do
    echo "project: "$i
    eval "git status ${array[$i]}"
done