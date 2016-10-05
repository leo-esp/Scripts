#!/bin/bash

Length=$(git diff --name-only --diff-filter=ACMR);
Length=${#Length} 

if [ "$Length" -gt 0 ]; then
foca $(git diff --name-only --diff-filter=ACMR);
git add -A;
fi

if [ "$Length" -eq 0 ]; then
	echo 'Não há arquivos modificados';
fi