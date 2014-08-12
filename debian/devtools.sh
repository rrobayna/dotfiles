#!/bin/sh

sudo apt-get update
sudo apt-get install -y vim tmux git wget exuberant-ctags make
sudo cp /usr/share/zoneinfo/America/New_York /etc/localtime
chsh -s /bin/bash
