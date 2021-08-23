#!/bin/bash

file=$HOME/.config/zathura/colors

FG=`xrdb -query | grep -w "*foreground" | cut -f 2`
FG_alt=`xrdb -query | grep -w "*foreground_alt" | cut -f 2`
BG=`xrdb -query | grep -w "*background" | cut -f 2`
BG_alt=`xrdb -query | grep -w "*background_alt" | cut -f 2`

a1=`xrdb -query | grep -w "*accent1" | cut -f 2`
a2=`xrdb -query | grep -w "*accent2" | cut -f 2`
a3=`xrdb -query | grep -w "*accent3" | cut -f 2`
a4=`xrdb -query | grep -w "*accent4" | cut -f 2`
a5=`xrdb -query | grep -w "*accent5" | cut -f 2`
a6=`xrdb -query | grep -w "*accent6" | cut -f 2`
a7=`xrdb -query | grep -w "*accent7" | cut -f 2`

alert=`xrdb -query | grep -w "*alert" | cut -f 2`
error=`xrdb -query | grep -w "*error" | cut -f 2`
warning=`xrdb -query | grep -w "*warning" | cut -f 2`



echo " # Zathura Color Preferennces" > $file

echo "set default-bg \"$BG\"
set default-fg \"$FG\"

set statusbar-fg \"$FG\"
set statusbar-bg \"$BG_alt\"

set inputbar-bg \"$BG_alt\"
set inputbar-fg \"$FG\" 

set notification-error-bg \"$error\"
set notification-error-fg \"#151515\" 

set notification-warning-bg \"$warning\"
set notification-warning-fg \"#151515\"

set highlight-color \"$a1\"
set highlight-active-color \"$a2\" 

set completion-highlight-fg \"#151515\" 
set completion-highlight-bg \"#90A959\" 

set completion-bg \"#303030\" 
set completion-fg \"#E0E0E0\" 

set notification-bg \"#90A959\" 
set notification-fg \"#151515\" 

set recolor-lightcolor \"#000000\"
set recolor-darkcolor \"#E0E0E0\"" >> $file

