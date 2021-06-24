#!/bin/bash

if [ "$EUID" -ne 0 ]
	then echo "must run as root"
	       exit
fi


pacman-key --init
dirmngr < /dev/null
wget https://archstrike.org/keyfile.asc
pacman-key --add keyfile.asc
pacman-key --lsign-key 9D5F1C051D146843CDA4858BDE64825E7CBC0D51
