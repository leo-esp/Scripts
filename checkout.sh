#!/bin/bash

for dir in ./*
do 
    cd $dir
    git checkout "$1"
done