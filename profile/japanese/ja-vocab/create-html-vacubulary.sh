#!/bin/bash


FILE=
WORD_LIST=()
WORD_R_LIST=()
WORD_M_LIST=()


while read LINE
do
IFS=" " read -r WORD STRING <<<"${LINE}"
# echo "Word: ${WORD}"
WORD_LIST+=( "${WORD}" );
delimiter=" - "
R_M_ARR=()
s=$STRING$delimiter
array=(); while [[ $s ]]; do array+=( "${s%%"$delimiter"*}" ); s=${s#*"$delimiter"}; done; 


if [[ ${STRING::1} == "【" ]]; then 
	READING=${array[0]}; WORD_R_LIST+=( "${READING}" );
	MEANING=${array[1]}; WORD_M_LIST+=( "${MEANING}" );
#	echo "Reading: ${READING}"
#	echo "Meaning: $MEANING"
else
	
	READING="ひらがなだけ"; WORD_R_LIST+=( "${READING}" );
	MEANING=${array[0]}; WORD_M_LIST+=( "${MEANING}" );
#	echo "Reading: ${READING}"
#	echo "Meaning: $MEANING"	
fi
done < words.txt

FILE+="<!DOCTYPE html>
<html>
<head>
<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
<style>
.buttons{
 	justify-content: center;
    	align-content: center;
	display: flex;
	width:100%;
}
.buttons button{
	margin: 10px;
	padding: 15px;
}
.words{
	font-size: 20px;
	font-weight:bold;
}

table, th, td {
	padding:15px;
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
</head>
<body>"

FILE+="<div class=\"buttons\"><button onClick=\"showReading()\">Readings</button>"
FILE+="<button onClick=\"showMeaning()\">Meanings</button></div>"

FILE+="<div id=\"container\"><table style=\"width:100%\">
<tr>
    <th>Word</th>
    <th>Reading</th>
    <th>Meaning</th>
  </tr>
"

for ((i = 0 ; i < ${#WORD_LIST[@]}; i++)); do
	 FILE+="<tr>
    <td><span class=\"words\">${WORD_LIST[$i]}</span></td>
    <td><span class=\"readings\" style=\"visibility:visible\">${WORD_R_LIST[$i]}</span></td>
    <td><span class=\"meanings\" style=\"visibility:visible\">${WORD_M_LIST[$i]}</span></td>
  </tr>"
	# FILE+="<li><span class=\"words\">${WORD_LIST[$i]}</span> <span class=\"readings\">${WORD_R_LIST[$i]}</span><span class=\"meanings\">${WORD_M_LIST[$i]}</span> </li>"
done

FILE+="</table></div></body>"


FILE+=$(cat scripts.js)
echo ${FILE} > vocabulary.html
