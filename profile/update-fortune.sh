#!/bin/bash

fortune=/usr/share/fortune/

opt=$1

if [[ $opt == "git" ]]; then

	[[ ! -f $fortune/bible ]] && echo "!! bible file not exists in local storage" && exit
		cp $fortune/bible files/bible

	[[ ! -f $fortune/bible ]] && echo "!! bible.dat file not exists in local storage" && exit
		cp $fortune/bible.dat files/bible.dat

else
	
	[[ ! -f files/bible ]] && echo "!! bible file not exists in git" && exit
		sudo cp files/bible $fortune/bible
	
	[[ ! -f files/bible.dat ]] && echo "!! bible.dat file not exists in git" && exit
		sudo cp files/bible.dat $fortune/bible.dat
	

fi

