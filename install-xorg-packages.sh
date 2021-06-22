#!/bin/bash

if [ "$EUID" -ne 0 ]
	then echo "Root is required!"
		exit
fi
echo "===> downloading XORG and NVIDIA packages"
echo

pacman -Sy --needed $(<xorg-packages.txt)

