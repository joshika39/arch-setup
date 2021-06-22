#!/bin/bash

if [ "$EUID" -ne 0 ]
	then echo "Root is required!"
		exit
fi
echo "===> downloading MISC and SOUND packages"
echo

pacman -Sy --needed $(<misc-packages.txt)

echo "=====> downloading Sound packages"
echo
pacman -Sy --needed $(<sound-packages.txt)
