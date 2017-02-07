#!/bin/bash
WS=`basename $PWD`
for var in `ls -l . | egrep '^d' | awk '{print $9}'`
do
    cd ~/SuperWorkspace/$WS/$var
    branch=`git branch | grep \* | cut -d ' ' -f2`
    xdg-open https://github.com/Valemobi/$var/$1
done