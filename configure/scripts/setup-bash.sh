#!/bin/bash


if [ "$EUID" -ne 0 ]
	then echo "Root is required!"
		exit

fi

mv /home/$SUDO_USER/.bashrc /home/$SUDO_USER/.bashrc.bak
cp ../files/bashrc /home/$SUDO_USER/.bashrc
source /home/$SUDO_USER/.bashrc 
