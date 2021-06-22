#!/bin/bash

if [ "$EUID" -ne 0 ]
	then echo "Root is required!"
		exit
fi
echo "===> downloading plasma packages"
echo

pacman -Sy --needed $(<plasma-packages.txt)

