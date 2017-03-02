#!/bin/bash
wasStashed=false

if [[ `git status --porcelain` ]]; then
  echo -e "\e[91mSalvando alterações\e[39m"
  git stash
  wasStashed=true
fi

echo -e "\e[91mMudando para branch origin\e[39m"
git checkout $1
echo -e "\e[91mAtualizando branch origin\e[39m"
git pull
echo -e "\e[91mCriando nova branch\e[39m"
git checkout -b $2
echo -e "\e[91mFazendo Push\e[39m"
git push -u origin $2
echo -e "\e[91mBranch Criada!\e[39m"

if $wasStashed; then
  echo -e "\e[91mAplicando alterações\e[39m"
  git stash pop
fi