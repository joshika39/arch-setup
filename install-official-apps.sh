#!/bin/bash

echo "====> Downloading official apps"
echo
pacman -Sy --needed $(<official-packages.txt) 
