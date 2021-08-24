#!/bin/bash

template=$HOME/.config/dunst/dunstrc.template

file=$HOME/.config/dunst/dunstrc

FG=`xrdb -query | grep -w "*foreground" | cut -f 2`
FG_alt=`xrdb -query | grep -w "*foreground_alt" | cut -f 2`
BG=`xrdb -query | grep -w "*background" | cut -f 2`

a1=`xrdb -query | grep -w "*accent1" | cut -f 2`
a2=`xrdb -query | grep -w "*accent2" | cut -f 2`
a3=`xrdb -query | grep -w "*accent3" | cut -f 2`
a4=`xrdb -query | grep -w "*accent4" | cut -f 2`
a5=`xrdb -query | grep -w "*accent5" | cut -f 2`
a6=`xrdb -query | grep -w "*accent6" | cut -f 2`
a7=`xrdb -query | grep -w "*accent7" | cut -f 2`

alert=`xrdb -query | grep -w "*alert" | cut -f 2`

cat $template > $file

echo "[low]
    msg_urgency = low
    background = \"$FG\"
    foreground = \"$BG\"
    timeout = 4

[normal]
    msg_urgency = normal
    background = \"$FG\"
    foreground = \"$BG\"
    timeout = 6

[critical]
    msg_urgency = critical
    background = \"$BG\"
    foreground = \"$alert\"
    timeout = 0
" >> $file


