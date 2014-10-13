#!/bin/bash
#
# Quickly configure server
# Look through before running

read -p "Add debian backports repo?' [y/n]: " ans
if [ $ans = y -o $ans = Y -o $ans = yes -o $ans = Yes -o $ans = YES ]; then
	echo "Adding debian backports repo"
	backports="deb http://ftp.debian.org/debian wheezy-backports main contrib non-free"
	bpexists=$(grep "$backports" /etc/apt/sources.list | wc -l)
	if [ $bpexists -eq 0 ]; then
		echo "Adding backports repository"
		sudo echo "$backports" >> /etc/apt/sources.list
	fi
fi

read -p "Set system localtime to US_NY?' [y/n]: " ans
if [ $ans = y -o $ans = Y -o $ans = yes -o $ans = Yes -o $ans = YES ]; then
	echo "Setting system clock"
	sudo cp /usr/share/zoneinfo/America/New_York /etc/localtime
fi

read -p "Install LAMP packages?' [y/n]: " ans
if [ $ans = y -o $ans = Y -o $ans = yes -o $ans = Yes -o $ans = YES ]; then
	echo "Installing LAMP packages"
	sudo apt-get update
	sudo apt-get install -y build-essential apache2 mysql-server php5 php5-mysql php-pear
fi
