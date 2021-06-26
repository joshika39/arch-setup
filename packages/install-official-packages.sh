#!/bin/bash

if [ "$EUID" -ne 0 ]
	then echo "Root is required!"
		exit
fi
echo "===> downloading Official Packages"
echo
PKG_DOWNLOAD=""
count=0

while read PKG
do
  if [[ ${PKG::1} != "#" && ${PKG::1} != "" ]]; then 
    # echo "This is a package!" 
    # echo ${count}
    if (( count == 0 )); then
      PKG_DOWNLOAD+="$PKG"
    else
      PKG_DOWNLOAD+=" $PKG"
    fi
    ((count+=1)) 
  fi
done < pkg/official-packages.txt

pacman -Sy --needed ${PKG_DOWNLOAD}
