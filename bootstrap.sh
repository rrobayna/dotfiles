#!/bin/bash
# written by Rafael Robayna <rrobayna@gmail.com>
# Quickly deploy your dotfiles

function installDotFiles() {
	echo "Bootstraping $HOME"
	echo "========================================"
	echo "Installing dotfiles..."
	linkFiles $PWD/home $HOME

	echo "Installing dotfolders..."
	linkFiles $PWD/home $HOME d

	echo "Installing scripts to $HOME/bin"
	[ ! -d "$HOME"/bin ] && mkdir "$HOME"/bin
	linkFiles $PWD/bin $HOME/bin

	echo "Installing dotfile submodules"
	git submodule update --init
	cd modules/ && make install && cd ..
	echo ""
	if hash vim 2>/dev/null && [ -f $PWD/home/.vimrc ]; then
		echo "Installing Vim Plugins..."

		if [ ! -d "$HOME"/.vim/bundle/Vundle.vim ]; then
			echo "Installing Vundle Plugin Manager for Vim..."
			git clone https://github.com/gmarik/Vundle.vim.git "$HOME"/.vim/bundle/Vundle.vim
		fi

		vim +PluginInstall +qall

		if [ -d "$HOME"/.vim/bundle/vimproc.vim ] && hash make 2>/dev/null; then
			echo "Building vimproc..."
			cd "$HOME"/.vim/bundle/vimproc.vim && make
		fi

		if [ ! -d "$HOME"/.wikis ]; then
			mkdir -p "$HOME"/.wikis/notes
		fi
		echo ""
	fi

	echo "Installation complete!"
}

function installBrew() {
	if [ `uname` = 'Darwin' ]; then
		if hash brew 2>/dev/null; then
	 		echo "Homebrew is not installed."
			while true; do
				read -p "Would you like the script to install it? (y/n) " yn
				case $yn in
					[Yy]* )
						ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
						break
						;;
					* ) exit;;
				esac
			done
		fi

		echo "Installing Brewfile..."
		sudo brew bundle osx/Brewfile
	else
		echo "Nothing to do here..."
	fi
}

function displayHelp() {
	echo "Bootstrap your dotfiles"
	echo ""
	echo "Usage: bootstrap.sh {install|brew|help}"
	echo ""
	echo "options:"
	echo "install			install dotfiles, vim plugins and more"
	echo "brew			install tools listed in the Brewfile"
	echo "help			display this information"
}

function linkFiles() {
	if [ $# -lt 2 ] || [ ! -d "$1" ] || [ ! -d "$2" ]; then
		echo "Error: source and destination paths required."
		exit
	fi
	[ $# -eq 2 ] && t="f"
	[ $# -eq 3 ] && t=$3
	s=$1
	d=$2
	for file in $(find $s -maxdepth 1 -type $t); do
		filename=$(basename "$file")
		if [ $filename == ".DS_STORE" ]; then
			continue
		fi
		if [ -f "$d"/"$filename" ]; then
			rm "$d"/"$filename"
		fi
		if [ -d "$d"/"$filename" ]; then
			rm -rf "$d"/"$filename"
		fi
		if [ -L "$d"/"$filename" ]; then
			unlink "$d"/"$filename"
		fi
		ln -s "$s"/"$filename" "$d"/"$filename"
	done
}

# Check for parameters
if [ $# -lt 1 ]; then
	displayHelp
	exit 1
fi

case $1 in
	"install"|"i")
		installDotFiles
		;;
	"brew")
		installBrew
		;;
	"help"|"h")
		displayHelp
		;;
	*)
		echo "Error: unrecognized command"
		displayHelp
esac
