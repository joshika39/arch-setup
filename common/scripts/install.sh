#!/bin/bash

if [ "$EUID" -ne 0 ]
	then echo "Root is required!"
		exit
fi
echo " --> Installing default packages" 

pacman -Syy
pacman -S reflector rsync curl

cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak

reflector --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Syu
cat /etc/pacman.d/mirrorlist

pacman -Sy --needed openssh networkmanager git sudo ntfs-3g nano vim
pacman -Sy --needed grub efibootmgr os-prober

systemctl enable NetworkManager
systemctl enable sshd
systemctl enable reflector.timer
systemctl start reflector.timer

grub-install
echo "GRUB_DISABLE_OS_PROBER=false" >> /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg

read -p "New Common user's Username:" user
line="%wheel ALL=(ALL) ALL"; sed -i "/^#$line/ c$line" /etc/sudoers

useradd -m -G wheel $user

