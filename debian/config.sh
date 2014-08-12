#!/bin/sh

echo "Setting clock"
sudo cp /usr/share/zoneinfo/America/New_York /etc/localtime
echo "Setting bash as default shell"
chsh -s /bin/bash
