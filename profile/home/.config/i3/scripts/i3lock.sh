#!/usr/bin/env bash

mapfile -t res < <(xrandr | grep '*' | awk '{print $1}')


for (( i=0; i < ${#res[@]}; i++ )); 
do
	if (( i == 0 )); then
		res1=${res[i]}
	else
		res2=${res[i]}
	fi
done

## Get colors -----------------
BG="#1e287d"
FG="#edebfc"

BLACK="#101542"
RED="#c76ec6"
GREEN="#34bfa8"
YELLOW="#e798cb"
BLUE="#5c5dca"
MAGENTA="#c76ec6"
CYAN="#3496bd"
WHITE="#4E5380"
MAGENTA2="#d642db"

lockimage=/tmp/lockimage.png

scrot $lockimage

mapfile -t displays < <(xrandr | grep ' connected')

for (( i=0; i<${#displays[@]}; i++)); do
#	echo $i
  	name=`echo ${displays[i]} | cut -d " " -f 1`


	if [[ `echo ${displays[i]} | cut -d " " -f 3` == "primary" ]]; then
		crop="`echo ${displays[i]} | cut -d " " -f 4`"
	else
		crop="`echo ${displays[i]} | cut -d " " -f 3`"
	fi
  
	import -silent -window root -crop $crop /tmp/image$i.png
done

images=()

for (( i=0; i < ${#displays[@]}; i++ ));
do
#	echo "${display[i]}"
	images+=( "/tmp/image$i.png" )
done

text="fortune linux"
font="Cica-Regular"
BLUR="5x4"
hue=(-level "0%,100%,0.6" -set colorspace Gray -average) 
effect=(-scale 20% -scale 500% )

for (( i=0; i < ${#images[@]}; i++ ))
do
	convert ${images[i]} "${hue[@]}" "${effect[@]}" ${images[i]}
	convert ${images[i]} -fill black -colorize 50% ${images[i]}
#	convert ${images[i]} -fill $MAGENTA2 -colorize 30% ${images[i]}	

	if (( i == 0 )); then

		convert ${images[i]} -gravity center -repage $res1+0+0 -font "$font" -pointsize 26 -fill "$MAGENTA" -annotate +0+250 "`$text`" ${images[i]}

	else	
		 
		convert ${images[i]} -gravity center -repage $res2+0+0 -font "$font" -pointsize 26 -fill "$MAGENTA" -annotate +0+250 "`$text`" ${images[i]}

	fi
done


convert ${images[@]} +append $lockimage

i3lock \
-i $lockimage \
--color="${BG}D9" \
\
--insidever-color=${GREEN}	\
--insidewrong-color=${RED}	\
--inside-color="${BG}00"	\
\
--ringver-color=${GREEN} \
--ringwrong-color=${RED} \
--ring-color=${BLUE} \
\
--line-color=${BG} \
--separator-color=${BG}	\
\
--keyhl-color=${YELLOW}	\
--bshl-color=${RED} \
\
--verif-color=${BG} \
--wrong-color=${FG} \
--layout-color=${FG} \
\
--time-color=${BLUE} \
--date-color=${BLUE} \
\
--pass-media-keys \
--pass-screen-keys \
--pass-power-keys \
--pass-volume-keys \
--{time,date,layout,verif,wrong}-font="Cica-Regular" \
--{time,date,layout,verif}-size=34 \
--{time,date,layout,verif,wrong}-align="centered" \
--wrong-size="24" \
--time-size=40 \
--date-size=24 \
--verif-text="検証" \
--wrong-text="間違ったパスワード" \
--noinput-text="空っぽ" \
--lock-text="Locking..." \
--lockfailed-text="Failed to lock" \
--radius 135 \
--ring-width 9.0 \
--screen 0 \
--clock	\
--indicator \
--time-str="%I:%M %p" \
--date-str="%b %d, %G" \

rm ${images[@]} 
rm $lockimage
