#!/bin/bash

read -p "Set bash as default shell?' [y/n]: " ans
if [ $ans = y -o $ans = Y -o $ans = yes -o $ans = Yes -o $ans = YES ]; then
	echo "Setting bash as default shell"
	chsh -s /bin/bash
fi

read -p "Install developer tools?' [y/n]: " ans
if [ $ans = y -o $ans = Y -o $ans = yes -o $ans = Yes -o $ans = YES ]; then
	sudo apt-get update
	sudo apt-get install -y vim-nox tmux git wget exuberant-ctags make jq curl
fi
