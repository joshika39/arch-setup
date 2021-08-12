#!/bin/bash

if [ "$EUID" -ne 0 ]
	then echo "Root is required!"
		exit
fi

while read PKG
do
pacman -U ${PKG}
done < ../files/old-pkg.txt



