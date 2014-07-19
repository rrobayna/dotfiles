#!/bin/sh

_configs=$PWD"/configs/"

# Install configs
echo "Installing configs to $HOME"

ls $_configs | while read _file; do
    cp $_configs/$_file $HOME/.$_file
done 

# Install Vundle Plugin Manager for Vim 
echo "Installing Vundle Plugin Manager for Vim..."
git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

echo "Installing Vim plugins..."
vim +PluginInstall +qall

echo "Installation complete!"
