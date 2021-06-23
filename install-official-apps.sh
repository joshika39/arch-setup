#!/bin/bash

echo "====> Downloading official apps"
echo
pacman -Sy --needed $(<packages/official-packages.txt) 
