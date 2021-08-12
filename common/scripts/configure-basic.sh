#!/bin/bash

host=${1:-arch}

echo $host
# echo $host > /etc/hostname
echo >> /etc/hosts
echo  "127.0.0.1	localhost" >> /etc/hosts
echo  "::1		localhost" >> /etc/hosts
echo  "127.0.1.1	$host.localdomain	$host" >> /etc/hosts

LOCALES=("en_US.UTF-8 UTF-8" "hu_HU.UTF-8 UTF-8" "ja-JP.UTF-8 UTF-8")

for ((i = 0; i < ${#LOCALES[@]}; i++))
do
    echo "${LOCALES[$i]}" >> /etc/locale.gen
done


echo "LANG=en_US.UTF-8" > /etc/locale.conf

