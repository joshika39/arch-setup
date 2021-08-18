#!/usr/bin/env bash

if [ -z $3 ] ; then
	MODE="--auto"
else
	MODE="--mode $3"
fi

if  xrandr | grep -q "$2 d"; then
	xrandr --output "$2" --off
else
	xrandr --output "$2" ${MODE}
	xrandr --output "$2" --right-of "$1"
fi

source $HOME/.config/xinit.d/00-detect-setup.sh

sh ~/.fehbg # wallpaper can look weird if not refreshed
sh ~/.config/polybar/launch.sh
