#!/bin/bash

backports="deb http://ftp.debian.org/debian wheezy-backports main contrib non-free"
bpexists=$(grep "$backports" /etc/apt/sources.list | wc -l)
if [ $bpexists -eq 0 ]; then 
	echo "Adding backports repository"
	echo "$backports" >> /etc/apt/sources.list
fi

echo "Setting clock"
cp /usr/share/zoneinfo/America/New_York /etc/localtime

echo "Setting bash as default shell"
chsh -s /bin/bash
