#!/bin/bash

file=$HOME/.config/rofi/colors.rasi

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



echo "* {" > $file

echo "selected-normal-foreground:  $FG;
    foreground:                  $FG;
    normal-foreground:           @foreground;
    alternate-normal-background: $BG_alt;
    selected-urgent-foreground:  $a1;
    urgent-foreground:           $a1;
    alternate-urgent-background: $BG_alt;
    active-foreground:           $FG;
    lightbg:                     $BG_alt;
    selected-active-foreground:  $a1;
    alternate-active-background: $BG;
    background:                  $BG;
    bordercolor:                 $FG;
    alternate-normal-foreground: @foreground;
    normal-background:           $BG_alt;
    lightfg:                     $FG;
    selected-normal-background:  $a1;
    border-color:                $BG_alt;
    spacing:                     2;
    separatorcolor:              $FG_alt;
    urgent-background:           $BG_alt;
    selected-urgent-background:  $a1;
    alternate-urgent-foreground: @urgent-foreground;
    background-color:            $BG_alt;
    alternate-active-foreground: @active-foreground;
    active-background:           $BG_alt;
    selected-active-background:  $FG_alt;
}" >> $file

