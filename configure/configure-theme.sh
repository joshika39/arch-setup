#!/bin/bash

if [ "$EUID" -ne 0 ]
	then echo "Must run as root"
		exit
fi

# echo ">>> Configuring theme"
# echo 
# lookandfeeltool -a org.kde.breezedark.desktop

# sudo mkdir /etc/sddm
sudo echo [Theme]  >> /etc/sddm.conf 
sudo echo Current=breeze >> /etc/sddm.conf
sudo echo CursorTheme=breeze-dark >> /etc/sddm.conf
	
