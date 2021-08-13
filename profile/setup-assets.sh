#!/bin/bash

bgs=/home/$USER/Pictures/Backgrounds/ 

if [[ ! -d $bgs ]]; then
	mkdir -p $bgs
fi

cp -rn /home/$USER/arch-setup/profile/files/assets/. $bgs
