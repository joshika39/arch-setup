#!/bin/bash

echo "====> Downloading official apps"
echo
pacman -Sy --needed $(<pkg/official-packages.txt) 
