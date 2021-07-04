#!/bin/bash

echo "====> Downloading official apps"
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
done < pkg/official-apps.txt

# echo ${PKG_DOWNLOAD}
pacman -Sy --needed ${PKG_DOWNLOAD}
