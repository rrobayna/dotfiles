#!/bin/sh

# Install configs
echo "Installing configs to $HOME"
cp $PWD/configs/vimrc $HOME/.vimrc
cp $PWD/configs/tmux.conf $HOME/.tmux.conf
cp $PWD/configs/gitconfig $HOME/.gitconfig

# Install Vundle Plugin Manager for Vim 
echo "Installing Vundle Plugin Manager for Vim..."
git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

echo "Installing Vim plugins..."
vim +PluginInstall +qall

echo "Installation complete!"
