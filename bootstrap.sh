#!/bin/bash

# Bootstrap your dotfiles

# Install configs
function installDotFiles() {
    echo "Bootstraping configuration for $HOME"
    echo "Installing dotfiles..."
    rsync --exclude ".DS_Store" -avh --no-perms $PWD/home/. ~

    echo "Installing bash includes..."
    [ ! -d $HOME/includes ] && mkdir $HOME/includes
    rsync --exclude ".DS_Store" -avh --no-perms $PWD/includes/. $HOME/includes/

    if [ ! -d $HOME/.vim/bundle/Vundle.vim ]; then
        echo "Installing Vundle Plugin Manager for Vim..."
        git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
    fi

    echo "Installing Vim plugins..."
    vim +PluginInstall +qall

    echo "Installation complete!"
}

function backupDotFiles() {
    _dotfiles=$PWD"/home/"
    echo "Backing up dotfiles..."
    # only backup the files already listed in the home folder
    ls $_dotfiles | while read _file; do
        rsync -avh --no-perms $HOME/$_file $_dotfiles/$_file
    done

    echo "Backing up includes..."
    #cp -r $HOME/includes/* $PWD/includes/

    #_status=$(git status -s | wc -l)

   # if [ $_status -gt 0 ]; then
   #     echo "Changes detected..."
   #     if [ $# -gt 0 ] && [[ $2 == "-a" ]]; then
   #         git status -s
   #         git add .
   #         git commit -m "AutoBackup"
   #         git push
   #         echo "Configs saved to local git repo."
   #     fi
   # else
   #     echo "No changes detected."
   # fi
}

function displayBrewInfo() {
    # Install homebrew files - must be run manually
    if [[ $(uname) != 'Linux' ]]; then
        # @todo check if homebrew is installed and install if not
        # ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
        # Install brew configs
        echo ""
        echo "To install the commandline tools listed in the Brewfile run: "
        echo "$ sudo brew bundle osx/Brewfile"
        echo ""
        echo "To install the desktop apps listed in the Caskfile run: "
        echo "$ sudo brew bundle osx/Caskfile"
        echo ""
    else
        echo "Homebrew configurations are only availible for OS X"
    fi
}


# Check for parameters
# this should probably return a list of commands instead of performing a default action
[ -n "$1" ] && _action=$1 || _action="install"

case $_action in
    "install"|"-i")
        installDotFiles ;;
    "backup"|"-b")
        backupDotFiles ;;
    "brew")
        displayBrewInfo ;;
    *)
        echo "Error: unrecognized command"
esac


