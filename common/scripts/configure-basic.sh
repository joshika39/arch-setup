#!/bin/bash
read -p "Enter a hostname:" host

# echo $host
echo ${host:-arch} > /etc/hostname
echo >> /etc/hosts
echo  "127.0.0.1	localhost" >> /etc/hosts
echo  "::1		localhost" >> /etc/hosts
echo  "127.0.1.1	$host.localdomain	$host" >> /etc/hosts

LOCALES=("en_US.UTF-8 UTF-8" "hu_HU.UTF-8 UTF-8" "ja_JP.UTF-8 UTF-8")

for ((i = 0; i < ${#LOCALES[@]}; i++))
do
    echo "${LOCALES[$i]}" >> /etc/locale.gen
done

locale-gen

echo "LANG=en_US.UTF-8" > /etc/locale.conf
