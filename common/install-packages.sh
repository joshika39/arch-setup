#!/bin/bash


if [ "$EUID" -ne 0 ]
	then echo "Root is required!"
		exit
fi

echo "===> Setting up the Packages"
echo
AUR=()
OFFICIAL=()

IFS=":"
while read PKG
do
  	if [[ ${PKG::1} != "#" && ${PKG::1} != "" ]]; then 
  		if [[ ${PKG::1} == "o" ]]; then 
  			read -r id split <<<"${PKG}"
			 
			if [[ ${split:0:4} == "-lts" ]]; then
				OFFICIAL+="${split#*-lts}$1"	
			else	
				OFFICIAL+=" $split"
			fi
		else	
  			 read -r id split <<<"${PKG}"
			 AUR+=( "${split}" )
		fi
	fi
done < files/packages.conf

pacman -Sy --needed ${OFFICIAL}
echo
echo " --> AUR:"

TEMP_DIR=$(mktemp -d)
CURRENT_DIR=$(pwd)

for pkg in ${AUR[@]}; do
	if ! pacman -Qs ${pkg} > /dev/null; then  
		echo $pkg
#      		cd $TEMP_DIR
#      		git clone https://aur.archlinux.org/${pkg}.git
#      		cd ${pkg} && makepkg -si --noconfirm && cd $TEMP_DIR
	fi
done



