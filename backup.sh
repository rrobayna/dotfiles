#!/bin/sh

CONFIGS=$PWD/dotfiles

# Install configs
echo "Backing up configs"

ls $CONFIGS | while read _file; do
    cp $HOME/.$_file $CONFIGS/$_file 
done 

_status=$(git status -s | wc -l)

if [ $_status -gt 0 ]; then
    echo "Changes detected..." 
    if [ $# -gt 0 ] && [[ $1 == "-a" ]]; then
        git status -s
        git add .
        git commit -m "AutoBackup"
        echo "Configs saved to local git repo."
    fi
else
    echo "No changes detected."
fi

