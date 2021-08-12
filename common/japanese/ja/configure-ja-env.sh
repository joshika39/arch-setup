#!/bin/bash

TEMP_DIR=$(mktemp -d)
CURRENT_DIR=$(pwd)

echo "====> Installing required fonts and tools" 
pacman -S ibus ibus-anthy

