#!/bin/bash

git add .
git commit -m "$1"
git push 

git checkout andbank_dev
git merge "$2"
git push