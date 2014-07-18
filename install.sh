#!/bin/sh

# Install vim config
if [ ! -d $HOME/.vim/bundle ]; then
    mkdir -p $HOME/.vim/bundle
    echo "dosen't exist"
else
    echo "exists"
fi

git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
cp $PWD/bundles.vim $HOME/.vim/bundles.vim
vim -u $HOME/.vim/bundles.vim +PluginInstall +qall
cp $PWD/vimrc ~/.vimrc

# Install tmux config
cp $PWD/tmux.conf $HOME/.tmux.conf
