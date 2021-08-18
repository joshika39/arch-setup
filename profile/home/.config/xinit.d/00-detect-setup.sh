#!/bin/usr/env bash

xrandr | grep 'connected\|disconnected' | awk '{print $1}' > ~/disp.txt

count=1
while read line
do
	if (( $count == 1)); then
		export MONITOR1=$line
		export MONITOR2=
	else
		export MONITOR2=$line
	fi
	count+=1
done < ~/disp.txt



mapfile -t res < <(xrandr | grep '*' | awk '{print $1}')

if (( ! ${#res[@]} == 2 )); then
	export RESOLUTION1=${res[0]}
	export RESOLUTION2=
else
	export RESOLUTION2=${res[1]}
fi	

