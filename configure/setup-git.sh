#!/bin/bash

read -p Email: GIT_EMAIL

ssh-keygen -t ed25519 -C $GIT_EMAIL
sudo -u joshika45 -i eval $(ssh-agent -s)

ssh-add /home/$USER//.ssh/id_ed25519
xclip -selection clipboard < /home/$USER//.ssh/id_ed25519.pub

echo "  --> SSH Public key copied."
read -n 1 -s -r -p "Press any key, when pasting into github is done..."
echo

#ssh -T git@github.com
echo "===> Done!"
