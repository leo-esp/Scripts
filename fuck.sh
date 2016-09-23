#!/bin/bash

Length=$(git ls-files --others --exclude-standard -m);
Length=${#Length} 

if [ "$Length" -gt 0 ]; then
foca $(git ls-files --others --exclude-standard -m);
git add -A;
fi

if [ "$Length" -eq 0 ]; then
	echo 'Não há arquivos modificados';
fi