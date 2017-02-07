#!/bin/bash
WS=`basename $PWD`
for var in `ls -l . | egrep '^d' | awk '{print $9}'`
do
    cd ~/SuperWorkspace/$WS/$var
    echo -e "\e[91m${var^^} \e[39m(\e[95m$branch\e[39m) --------------------------------------------------------------------------- \e[91m${var^^}\e[39m"
    echo 
    git tag | grep $1
done