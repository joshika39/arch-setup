#!/bin/bash


echo "===> Setting up the Fonts"
echo
AUR=()
OFFICIAL=()

IFS=":"
while read PKG
do
  	if [[ ${PKG::1} != "#" && ${PKG::1} != "" ]]; then 
  		if [[ ${PKG::1} == "o" ]]; then 
  			 read -r id split <<<"${PKG}"
			 OFFICIAL+="${split} "
		else	
  			 read -r id split <<<"${PKG}"
			 AUR+=( "${split}" )
		fi
	fi
done < files/fonts.conf

echo " --> Official:"
pacman -Sy --needed ${OFFICIAL}

echo
echo " --> AUR:"

TEMP_DIR=$(mktemp -d)
CURRENT_DIR=$(pwd)

for pkg in ${AUR[@]}; do
	if ! pacman -Q ${pkg} > /dev/null; then  
      		cd $TEMP_DIR
      		git clone https://aur.archlinux.org/${pkg}.git
      		cd ${pkg} && makepkg -si --noconfirm && cd $TEMP_DIR
	fi
done



