#!/bin/bash

echo "===> Downloadin AUR apps with Yay"
echo
TEMP_DIR=$(mktemp -d)
CURRENT_DIR=$(pwd)

# Load extra keys
# dropbox
# gpg --recv-keys 1C61A2656FB57B7E4DE0F4C1FC918B335044912E

# spotify
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | gpg --import -
gpg --auto-key-locate nodefault,wkd --locate-keys torbrowser@torproject.org

while read AUR_PKG
do
  if [[ ${AUR_PKG::1} != "#" && ${AUR_PKG::1} != "" ]]; then 
    if ! pacman -Q ${AUR_PKG} > /dev/null; then  
      cd $TEMP_DIR
      git clone https://aur.archlinux.org/${AUR_PKG}.git
      cd ${AUR_PKG} && makepkg -si --noconfirm && cd $TEMP_DIR
    fi
  fi
done < pkg/aur-packages.txt
