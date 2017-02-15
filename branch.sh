#!/bin/bash
echo "Atualizando branch origin"
git checkout $1
git pull
git checkout -b $2
git push -u origin $2
echo "Branch Criada!"