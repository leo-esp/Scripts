#!/bin/bash
WS=`basename $PWD`
for var in `ls -l . | egrep '^d' | awk '{print $9}'`
do
    cd ~/$WS/$var
    branch=`git branch | grep \* | cut -d ' ' -f2`
    length=$((127 - $(($((${#var}))*2+$((${#branch}))+2))))
    s=$(printf "=%.0s" $(seq 1 $length))            
        
    echo
    echo -e "\e[91m${var^^} \e[39m(\e[95m$branch\e[39m) $s \e[91m${var^^}\e[39m"
    echo 
    s=$(printf "=%.0s" {1..127})
    git status $1 
done