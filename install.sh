#!/bin/bash

CONFIGS=$PWD"/configs/"

# Install configs
echo "Bootstraping configuration for $HOME"
ls $CONFIGS | while read _file; do
    cp $CONFIGS/$_file $HOME/.$_file
done 

if [[ $(uname) != 'Linux' ]]; then
    # @todo check if homebrew is installed 
    # ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
    # Install brew configs
    echo "Bootstrapping OS X commandline apps using Homebrew"
    cp $PWD/Brewfile $HOME/Brewfile
    echo "Bootstrapping OS X desktop apps using Homebrew Cask"
    cp $PWD/Caskfile $HOME/Caskfile
fi

if [ ! -d $HOME/.vim/bundle/Vundle.vim ]; then
    # Install Vundle Plugin Manager for Vim 
    echo "Installing Vundle Plugin Manager for Vim..."
    git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi

echo "Installing Vim plugins..."
vim +PluginInstall +qall

echo "Installation complete!"
