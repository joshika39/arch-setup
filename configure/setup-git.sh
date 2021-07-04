#!/bin/bash

read -p Email: GIT_EMAIL

ssh-keygen -t ed25519 -C $GIT_EMAIL
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
xclip -selection clipboard < ~/.ssh/id_ed25519.pub
echo "===> DONE."
read -n 1 -s -r -p "Press any key to continue"
echo
ssh -T git@github.com
