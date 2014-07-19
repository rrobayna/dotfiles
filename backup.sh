#!/bin/sh

CONFIGS=$PWD/configs

cp $HOME/.vimrc $CONFIGS/vimrc 
cp $HOME/.tmux.conf $CONFIGS/tmux.conf
cp $HOME/.gitconfig.conf $CONFIGS/gitconfig.conf
# Check if there is a difference in git status

git add .
git commit -m "AutoBackup"
