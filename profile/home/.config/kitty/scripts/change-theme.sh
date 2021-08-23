#!/bin/bash

file=$HOME/.config/kitty/colors.conf

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



echo " # Kitty Color Preferennces" > $file

echo "foreground	$FG" >> $file
echo "background	$BG" >> $file

 # Color 0
echo "color0	$a1" >> $file
echo "color8	$a1" >> $file

 # Color 1
echo "color1	$a4" >> $file
echo "color9	$a4" >> $file

 # Color 2
echo "color2	$a6" >> $file
echo "color10	$a6" >> $file

 # Color 3
echo "color3	$a2" >> $file
echo "color11	$a2" >> $file

 # Color 4
echo "color4	$a5" >> $file
echo "color12	$a5" >> $file

 # Color 5
echo "color5	$a4" >> $file
echo "color13	$a4" >> $file

 # Color 6
echo "color6	$a6" >> $file
echo "color14	$a6" >> $file

 # Color 7
echo "color7	$a6" >> $file
echo "color15	$a6" >> $file

# Cursor colors
echo "cursor	$FG" >> $file                          
echo "cursor_text_color		$FG_alt" >> $file

# URL underline color when hovering with mouse
echo "url_color		$a1" >> $file

#selection_foreground            #000000
#selection_background            #fffacd

# kitty window border colors
#active_border_color             #00ff00
#inactive_border_color           #cccccc
# bell_border_color               #ff5a00

# Tab bar colors
#active_tab_foreground           #000
#active_tab_background           #eee
#inactive_tab_foreground         #444
#inactive_tab_background         #999
#tab_bar_background              none

# normal
#color0 #1e287d
#color1 #c76ec6
#color2 #3496bd
#color3 #e798cb
#color4 #5c5dca
#color5 #c76ec6
#color6 #3496bd
#color7 #ffffff

# bright
#color8 #8e93be
#color9 #c76ec6
#color10 #3496bd
#color11 #e798cb
#color12 #5c5dca
#color13 #c76ec6
#color14 #3496bd
#color15 #ffffff
