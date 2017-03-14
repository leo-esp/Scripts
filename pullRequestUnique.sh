#!/bin/bash
branch_name="$(git symbolic-ref HEAD 2>/dev/null)" ||
branch_name="(unnamed branch)"     # detached HEAD
branch_name=${branch_name##refs/heads/}

project="$(basename $PWD)"  # Returns just "to"

xdg-open https://github.com/Valemobi/$project/compare/$1...$branch_name