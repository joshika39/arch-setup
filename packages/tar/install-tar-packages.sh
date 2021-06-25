#!/bin/bash

echo "====> Extracting and Installing tar applications"
echo

DIR="/home/$USER/tar-install"
CURRENT_DIR=$(pwd)
count=0

mkdir -p ${DIR}


while read WGET_FILE
do
    
  cd ${DIR}  
  echo "===>> Downloading: " ${WGET_FILE}
  echo "DIR===>> ${DIR}" 
  # echo ${count}
  
  # mkdir ${count}
  # cd ${count}
  PASSED=$(basename ${WGET_FILE})
  wget ${WGET_FILE} 
  
    if [ ! -f "$PASSED" ] ; then
        echo "'$PASSED' does not exist."
        return 1
    fi

    case "$PASSED" in
        *.tar.bz2)   tar xvjf "$PASSED"   ;;
        *.tar.xz)    tar xvJf "$PASSED"   ;;
        *.tar.gz)    tar xvzf "$PASSED"   ;;
        *.bz2)       bunzip2 "$PASSED"    ;;
        *.rar)       rar x "$PASSED"      ;;
        *.gz)        gunzip "$PASSED"     ;;
        *.tar)       tar xvf "$PASSED"    ;;
        *.tbz2)      tar xvjf "$PASSED"   ;;
        *.tgz)       tar xvzf "$PASSED"   ;;
        *.zip)       unzip "$PASSED"      ;;
        *.Z)         uncompress "$PASSED" ;;
        *.xz)        xz -d "$PASSED"      ;;
        *.7z)        7z x "$PASSED"       ;;
        *.a)         ar x "$PASSED"       ;;
        *)           echo "Unable to extract '$PASSED'." ;;
    esac
  ((count=count+1))
done < ${CURRENT_DIR}/download.txt
