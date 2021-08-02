#!/bin/bash

TEMP_DIR=$(mktemp -d)
CURRENT_DIR=$(pwd)

echo "====> Installing required fonts and tools"
pacman -S adobe-source-han-sans-jp-fonts otf-ipafont

pacman -S ibus ibus-anthy

