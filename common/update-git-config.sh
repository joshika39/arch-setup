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
		echo "Fear not! Imma make it for ya!"
		mkdir $GIT_DIR$homesub
	fi



	bFoldername="$HOME/.oldconfigs/"

	if [[ ! -d $bFoldername ]]; then
		echo "No backups yet, creating new folder:"
		echo $bFoldername
		echo
		mkdir $bFoldername
	fi

	BACKUP_ORIG=$bFoldername 

	BACKUP="$BACKUP_ORIG$TIME/"

	if [[ ! -d $BACKUP ]]; then
#		echo
#		echo "Too faaast, wait only a minute, and try again"
#		echo "(Warning: folder already exists) c:"
#		echo
#		exit	
		mkdir $BACKUP
	fi


	
	for ((i = 0; i < ${#backups[@]}; i++))
	do
		current=$GIT_DIR$homesub${backups[$i]}
		des=$BACKUP${backups[$i]}
		live=$MAIN_DIR${backups[$i]}
		git=$GIT_DIR$homesub
		if [[ -d $live || -f $live ]]; then
			if [[ -d $current || -f $current ]]; then	
				echo "Backing Git: $(cp -rv $current $des)" >> $BACKUP/.log
#				echo "$current --> $des"
#				echo "new: $live --> $current"
			fi
			echo "Copy: $(cp -rv $live $git)" >> $BACKUP/.log
		else
			echo $live
		fi
	done
done < $1

git add ./
git commit -m "config update $TIME"
gut push -u

