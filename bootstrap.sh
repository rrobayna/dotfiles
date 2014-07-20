#!/bin/bash
# Maintained by Rafael Robayna <rrobayna@gmail.com>
# Bootstrap your dotfiles
# Helper script to perform quick install, backup and commit actions to save your dotfiles

# Install configs
function installDotFiles() {
    echo "Bootstraping $HOME"
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
    echo "Backing up dotfiles..."
    # limit backup to files already in the dotfiles/home folder
    _dotfiles=$(ls -A home/ | egrep '^\.')
    for _file in $_dotfiles; do
        _diff=$(diff $HOME/$_file $PWD/home/$_file)
        if [ -n "$_diff" ]; then
            rsync -ah --no-perms $HOME/$_file $PWD/home/$_file > /dev/null 2>&1
            echo $_file
        fi
    done
}

function autoCommit() {
    _status=$(git status -s | wc -l)

    if [ $_status -gt 0 ]; then
        echo "Changes detected..."
        if [ $# -gt 0 ] && [[ $2 == "-a" ]]; then
            git status -s
            git add .
            git commit -m "Backing up dotfiles"
            git push
            echo "Configs saved and pushed upstream."
        fi
    else
        echo "No changes detected."
    fi
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


function displayHelp() {
    echo "Bootstrap your dotfiles"
    echo "Usage: bootstrap.sh [OPTION]"
    echo ""
    echo "Options:"
    echo "-i or install         install dotfiles, vim plugins and more"
    echo "-b or backup          backup dotfiles"
    echo "-c or commit          auto-commit a backup of your dotfiles to your upstream repo"
    echo "-br or brew           display homebrew install info"
    exit 0;
}

# Check for parameters
[ -n "$1" ] && displayHelp; exit 1

case $_action in
    "install"|"-i")
        installDotFiles ;;
    "backup"|"-b")
        backupDotFiles ;;
    "brew"|"-br")
        displayBrewInfo ;;
    "commit"|"-c")
        autoCommit ;; 
    "help"|"--help")
        displayHelp ;;
    *)
        echo "Error: unrecognized command"
        displayHelp
esac


