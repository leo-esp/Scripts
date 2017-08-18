#!/bin/bash
wasStashed=false
isCommit=false

while getopts c: option
do
    case "${option}"
    in
    c)
        isCommit=true
        commitMessage=${OPTARG}
    ;;
    esac
done

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

if $isCommit; then
    if [[ $commitMessage == '' ]]; then
        echo -e "Tem certeza que deseja commitar sem mensagem (y/n)? "
        read -p "" -n 1 -r
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            git commit -am '.'
        fi
    else
        git commit -am '$commitMessage'
    fi
    git push
fi