#!/bin/sh
# Check if git status returns null
cp ~/.vimrc "$PWD"/vimrc 
#cp -r ~/.vim "$PWD"/vim
git add .
git commit -m "AutoBackup"
