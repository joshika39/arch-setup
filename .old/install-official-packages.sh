#!/bin/bash

if [ "$EUID" -ne 0 ]
	then echo "Root is required!"
		exit
fi
echo "===> downloading Official Packages"
echo
PKG_DOWNLOAD=""
count=0
VER=${1}
# echo $VER
# echo

while read PKG
do
	if [[ ${PKG::1} != "#" && ${PKG::1} != "" ]]; then 
	# echo "This is a package!" 
	# echo ${count}
		if [[ ${PKG:0:4} == "-lts" ]]; then
			PKG_DOWNLOAD+="${PKG#*-lts}$VER"	
		else	
			PKG_DOWNLOAD+=" $PKG"
		fi
		((count+=1)) 
	fi
done < pkg/official-packages.txt
echo ${PKG_DOWNLOAD}
echo " -> Installing packages"
echo
pacman -Sy --needed ${PKG_DOWNLOAD}
