#!/bin/bash
# Maintained by Rafael Robayna <rrobayna@gmail.com>
# Bootstrap your dotfiles
# Helper script to perform quick install, backup and commit actions to save your dotfiles

# Install configs
function installDotFiles() {
	echo "Bootstraping $HOME"
	echo "Installing dotfiles..."
	rsync --exclude ".DS_Store" -avh --no-perms $PWD/home/. ~

	echo "Installing scripts to $HOME/bin"
	[ ! -d $HOME/bin ] && mkdir $HOME/bin
	rsync --exclude ".DS_Store" -avh --no-perms $PWD/bin/. $HOME/bin/

	if [ ! -d $HOME/.vim/bundle/Vundle.vim ]; then
		echo "Installing Vundle Plugin Manager for Vim..."
		git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
	fi

	echo "Installing Vim plugins..."
	vim +PluginInstall +qall

	if [ -d $HOME/.vim/bundle/vimproc.vim ]; then
		echo "Building vimproc..."
		cd $_HOME/.vim/bundle/vimproc.vim && make
	fi

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
		git status -s
		git add .
		git commit -m "Backing up dotfiles"
		git push
		echo "Configs saved and pushed upstream."
	else
		echo "No changes detected."
	fi
}

#function displayBrewInfo() {
#	 if [[ $(uname) != 'Linux' ]]; then
#		 echo ""
#		 echo "To install homebrew run:"
#		 echo "$ ruby -e \"$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)\""
#		 echo ""
#		 echo "To install the commandline tools listed in the Brewfile run:"
#		 echo "$ sudo brew bundle osx/Brewfile"
#		 echo ""
#		 echo "To install the desktop apps listed in the Caskfile run:"
#		 echo "$ sudo brew bundle osx/Caskfile"
#		 echo ""
#	 else
#		 echo "Homebrew configurations are only availible for OS X"
#	 fi
#}

function displayHelp() {
	echo "Bootstrap your dotfiles"
	echo "Usage: bootstrap.sh [OPTION]"
	echo ""
	echo "Options:"
	echo "install or i			install dotfiles, vim plugins and more"
	echo "backup or b			backup dotfiles"
	echo "commit or c			auto-commit a backup of your dotfiles to your upstream repo"
	exit 0;
}

# Check for parameters
if [ $# -lt 1 ]; then
	displayHelp
	exit 1
fi

case $1 in
	"install"|"i")
		installDotFiles ;;
	"backup"|"b")
		backupDotFiles ;;
	"commit"|"c")
		autoCommit ;;
	"help"|"--help")
		displayHelp ;;
	*)
		echo "Error: unrecognized command"
		displayHelp
esac
