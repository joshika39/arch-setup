#!/bin/bash

time=$(date +"%Y_%m_%d_%H:%M")

folder=$HOME/Pictures/Screenshots

[[ ! -d $folder ]] && mkdir -p $folder

	selected=$(echo "Full
Rectangle
Program" | rofi -dmenu -p "Select Screenshot Type")

[[ -z $selected ]] && exit

if [[ $selected == "Full" ]];then 
	sleep 1
	import -silent -window root $folder/$time-screenshot.jpg
fi

if [[ $selected == "Rectangle" ]];then 
	sleep 1
	import $folder/$time-screenshot.jpg
fi

if [[ $selected == "Program" ]];then 
	import $folder/$time-screenshot.jpg
fi
