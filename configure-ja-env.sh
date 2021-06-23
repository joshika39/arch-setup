#!/bin/bash

TEMP_DIR=$(mktemp -d)
CURRENT_DIR=$(pwd)

echo
pacman -S adobe-source-han-sans-jp-fonts otf-ipafont

if ! pacman -Q ttf-monapo > /dev/null; then
	cd $TEMP_DIR
	git clone https://aur.archlinux.org/ttf-monapo.git
	cd ttf-monapo && makepkg -si --noconfirm && cd $TEMP_DIR
fi

