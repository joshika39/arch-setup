#!/bin/bash

if [[ -z $1 ]]; then

	echo "ERROR: No backup file list passed..."
	echo
	exit
fi

TIME=$(date +'%Y_%m_%d-%H_%M')

while read file
do
	if [[ ! -f $HOME/$file ]]; then
		echo "Ahh, this file (${file:-'empty line'}), doesn't exists :c"
		continue
	fi

	source $HOME/$file
	echo $file: $homesub
	echo

	echo $MAIN_DIR
	echo $GIT_DIR
	echo

	if [[ ! -d $GIT_DIR$homesub ]]; then
		echo
		echo "Ahh, no dir in git for $homesub :c "
		exit
	fi



	bFoldername="$HOME/.oldhomecontent/"

	if [[ ! -d $bFoldername ]]; then
		echo "No backups yet, creating new folder:"
		echo $bFoldername
		echo
		mkdir $bFoldername
	fi

	BACKUP_ORIG=$bFoldername 

	BACKUP="$BACKUP_ORIG$TIME/"

	if [[ ! -d $BACKUP ]]; then
		mkdir $BACKUP
	fi
	
	for ((i = 0; i < ${#backups[@]}; i++))
	do
		current=$GIT_DIR$homesub${backups[$i]}
		des=$BACKUP${backups[$i]}
		live=$MAIN_DIR${backups[$i]}
		git=$GIT_DIR$homesub
		
		if [[ -d $current || -f $current ]]; then
			if [[ -d $live || -f $live ]]; then	
				echo "Backing up home: $(cp -rv $live $des)" >> $BACKUP/.log
			fi
			echo "Copy: $(cp -rv $current $live)" >> $BACKUP/.log
		else
			echo $live
		fi
	done
done < $1
