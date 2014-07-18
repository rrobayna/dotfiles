#!/bin/sh

# Create the vim home folder
if [ ! -d $HOME/.vim/bundle ]; then
    mkdir -p $HOME/.vim/bundle
    echo "dosen't exist"
else
    echo "exists"
fi

# @todo check if I need this?
git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

# Install configs
# @todo replace this with a for read file that moves each file out
cp $PWD/configs/bundles.vim $HOME/.vim/bundles.vim
cp $PWD/configs/vimrc $HOME/.vimrc
cp $PWD/configs/tmux.conf $HOME/.tmux.conf
cp $PWD/configs/gitconfig $HOME/.gitconfig

# Install vim plugins
# check if this install can be performed with the vimrc?
vim -u $HOME/.vim/bundles.vim +PluginInstall +qall
