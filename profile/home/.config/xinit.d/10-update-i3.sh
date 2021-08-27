#!/bin/bash

# . $HOME/.config/xinit.d/screencheck.sh
. $HOME/.config/xinit.d/00-detect-setup.sh

 echo $MONITOR1
 echo $MONITOR2
 echo $RESOLUTION1
 echo $RESOLUTION2
loc=$HOME/.config/i3/config

sed -i "/set \$monitor1/c\set \$monitor1 $MONITOR1" $loc
sed -i "/set \$monitor2/c\set \$monitor2 $MONITOR2" $loc

sed -i "/set \$res1/c\set \$res1 $RESOLUTION1" $loc
sed -i "/set \$res2/c\set \$res2 $RESOLUTION2" $loc



loc=$HOME/.bashrc

sed -i "/export MONITOR1/c\\export MONITOR1=$MONITOR1" $loc
sed -i "/export MONITOR2/c\\export MONITOR2=$MONITOR2" $loc

sed -i "/export RESOLUTION1/c\\export RESOLUTION1=$RESOLUTION1" $loc
sed -i "/export RESOLUTION2/c\\export RESOLUTION2=$resolution2" $loc

. $loc
