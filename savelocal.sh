#!/bin/sh
cp ~/.vimrc $PWD/vimrc 
cp ~/.tmux.conf $PWD/tmux.conf
# Check if there is a difference in git status

git add .
git commit -m "AutoBackup"
