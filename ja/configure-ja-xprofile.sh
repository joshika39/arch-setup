#!/bin/bash
echo "" > /home/$USER/.xprofile
echo "export GTK_IM_MODULE='ibus'" >> /home/$USER/.xprofile 
echo "export QT_IM_MODULE='ibus'" >> /home/$USER/.xprofile
echo  "export XMODIFIERS=@im='ibus'" >> /home/$USER/.xprofile

echo "ibus-daemon -drx" >> /home/$USER/.xprofile

