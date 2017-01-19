#!/bin/bash
WS=`basename $PWD`
for var in `ls -l . | egrep '^d' | awk '{print $9}'`
do
    cd ~/$WS/$var
    echo
    echo -e "\e[91m${var^^} \e[39m --------------------------------------------------------------------------- \e[91m${var^^}\e[39m"
    echo 
    git status
done