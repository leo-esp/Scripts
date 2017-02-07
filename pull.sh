#!/bin/bash
WS=`basename $PWD`
for var in `ls -l . | egrep '^d' | awk '{print $9}'`
do
    cd ~/$WS/$var
    branch=`git branch | grep \* | cut -d ' ' -f2`
    echo
    echo -e "\e[91m${var^^} \e[39m(\e[95m$branch\e[39m) --------------------------------------------------------------------------- \e[91m${var^^}\e[39m"
    echo 
    git pull $1
done