#!/bin/bash

. $HOME/.config/i3/scripts/test.sh $MONITOR1 $RESOLUTION1 monr

exec -a $HOME/.config/i3/scripts/run.sh i3
