#!/bin/bash

if [ "$EUID" -ne 0 ]
	then echo "Root is required!"
		exit
fi

echo "blacklist pcspkr" >> /etc/modprobe.d/nobeep.conf
echo "setterm -blength 0" >> /etc/profile
echo "set bell-style none" >> /etc/inputrc
sudo -u $SUDO_USER echo "set bell-style none" >> /home/$USER/.inputrc
