#!/bin/bash

CONFIGS=$PWD"/dotfiles/"
INCLUDES=$PWD"/includes/"

# Install configs
echo "Bootstraping configuration for $HOME"
echo "Installing dotfiles..."
ls $CONFIGS | while read _file; do
    cp $CONFIGS/$_file $HOME/.$_file
done 

# Install include scripts
echo "Installing bash includes..."
if [ ! -d $HOME/includes ]; then
    mkdir $HOME/includes
fi
cp -r $INCLUDES $HOME/includes/

if [ ! -d $HOME/.vim/bundle/Vundle.vim ]; then
    # Install Vundle Plugin Manager for Vim 
    echo "Installing Vundle Plugin Manager for Vim..."
    git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi

echo "Installing Vim plugins..."
vim +PluginInstall +qall

# Install homebrew files - must be run manually
if [[ $(uname) != 'Linux' ]]; then
    # @todo check if homebrew is installed and install if not
    # ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
    # Install brew configs
    echo "Bootstrapping OS X commandline apps using Homebrew"
    echo ""
    echo "To install the commandline tools listed in the Brewfile run: "
    echo "$ sudo brew bundle homebrew/Brewfile"
    echo ""
    echo "To install the desktop apps listed in the Caskfile run: "
    echo "$ sudo brew bundle homebrew/Caskfile"
    echo ""
fi

echo "Installation complete!"
