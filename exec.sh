#!/bin/bash
branch_name="$(git symbolic-ref HEAD 2>/dev/null)" ||
branch_name="(unnamed branch)"     # detached HEAD

branch_name=${branch_name##refs/heads/}

echo "$branch_name"

xdg-open https://github.com/Valemobi/valebroker-html-web/compare/$1...$branch_name