#!/bin/sh

CONFIGS=$PWD"/configs/"

# Install configs
echo "Installing configs to $HOME"

ls $CONFIGS | while read _file; do
    cp $CONFIGS/$_file $HOME/.$_file
done 

#Install brew configs
echo "Installing Homebrew configs to $HOME"
cp $PWD/Brewfile $HOME/Brewfile
cp $PWD/Caskfile $HOME/Caskfile

# Install Vundle Plugin Manager for Vim 
echo "Installing Vundle Plugin Manager for Vim..."
git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

echo "Installing Vim plugins..."
vim +PluginInstall +qall

echo "Installation complete!"
