#!/bin/bash

# cd firefox-sweet-theme
# ./scripts/install.sh

TEMP_DIR=$(mktemp -d)
CURRENT_DIR=$(pwd)
firefox -CreateProfile "sweet /home/$USER/.mozilla/firefox/joshua"
firefox -CreateProfile "sweet-dev /home/$USER/.mozilla/firefox/joshua-dev"

INSTALL_LOC="/home/$USER/.mozilla/firefox/installs.ini"

#while read LINE 
#do
#  if [[ ${LINE::1} == "[" ]]; then 
#	  INSTALLS+=($LINE)
#  fi
#done < /home/$USER/.mozilla/firefox/installs.ini

rm /home/$USER/.mozilla/firefox/installs.ini
#touch /home/$USER/.mozilla/firefox/installs.ini

#for i in "${INSTALLS[@]}"; do
#	echo $i >> "$INSTALL_LOC"
#	echo Default=joshua >> "${INSTALL_LOC}"
#	echo Locked=1 >> "${INSTALL_LOC}"
#	echo >> $INSTALL_LOC
#done

rm /home/$USER/.mozilla/firefox/profiles.ini
touch /home/$USER/.mozilla/firefox/profiles.ini
LOC=$(ls /home/$USER/.mozilla/firefox/profiles.ini)

INSTALLS=('[46F492E0ACFF84D4]' '[4F96D1932A9F858E]')
PROFILES=('joshua-dev' 'joshua')
for i in {0..1}; do
	INSTALL="$(echo ${INSTALLS[$i]} | sed 's/[][]//g')"
	echo [Install${INSTALL}] >> $LOC
	echo Default=${PROFILES[$i]} >> $LOC
	echo Locked=1 >> $LOC
	echo "" >> $LOC
done
# INSTALL=$(head -n 1 /home/$USER/.mozilla/firefox/installs.ini )
 

echo [Profile0] >> $LOC
echo Name=sweet >> $LOC
echo isRelative=1 >> $LOC
echo Path=joshua >> $LOC
echo Default=1 >> $LOC
echo IsRelative=1 >> $LOC
echo "" >> $LOC

echo [Profile1] >> $LOC
echo Name=sweet-dev >> $LOC
echo isRelative=1 >> $LOC
echo Path=joshua-dev >> $LOC
echo Default=1 >> $LOC
echo IsRelative=1 >> $LOC
echo "" >> $LOC

echo [General] >> $LOC
echo StartWithLastProfile=1 >> $LOC
echo Version=2 >> $LOC


cd $TEMP_DIR
git clone https://github.com/EliverLara/firefox-sweet-theme
cd firefox-sweet-theme && ./scripts/install.sh -g -p joshua && ./scripts/install.sh -g -p joshua-dev && cd $TEMP_DIR

