#!/bin/bash


	
if [[ -z $1 ]]; then
	name=$(cat $HOME/.colors/theme-list.txt | rofi -dmenu -p "Select a Theme")
	[[ -z $name ]] && exit	
else
	name=$1
fi

ln -sf $HOME/.colors/$name.Xcolors $HOME/.xcolorscheme
ln -sf $HOME/.colors/assets/$name.jpg $HOME/.BG.jpg

xrdb -merge $HOME/.Xresources

. $HOME/.config/kitty/scripts/change-theme.sh
. $HOME/.config/rofi/scripts/change-theme.sh

kitty @ set-colors -a $HOME/.config/kitty/colors.conf

. $HOME/.config/polybar/launch.sh

feh --no-fehbg --bg-fill "$HOME/.BG.jpg"


