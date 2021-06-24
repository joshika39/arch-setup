#!/bin/bash

if [ "$EUID" -ne 0 ] 
	then echo "must run as root"
		exit
fi

echo "[archstrike]" >> /etc/pacman.conf
echo "Server = https://mirror.archstrike.org/\$arch/\$repo" >> /etc/pacman.conf

