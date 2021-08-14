#!/bin/bash

if [ "$EUID" -ne 0 ]
	then echo "Root is required!"
		exit
fi
echo " --> Installing default packages" 

if [[ $1 == "live" && -z $2 ]]; then
	echo "Live option choosed, but not passed the device name! Exiting..."
	echo
	exit
fi

if [[ $1 == "live" ]]; then
	pacman -Sy --needed openssh networkmanager git sudo ntfs-3g dosfstools nano vim
	pacman -Sy --needed grub efibootmgr
	
	grub-install --target=i386-pc $2 --recheck
	grub-install --target=x86_64-efi --efi-directory=/boot/efi --removable --recheck
else

	pacman -Syy
	pacman -S reflector rsync curl

	cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak

	reflector --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
	sudo pacman -Syu
	cat /etc/pacman.d/mirrorlist

	pacman -Sy --needed openssh networkmanager git sudo ntfs-3g dosfstools nano vim
	pacman -Sy --needed grub efibootmgr os-prober

	systemctl enable reflector.timer
	systemctl start reflector.timer
	
	grub-install
	echo "GRUB_DISABLE_OS_PROBER=false" >> /etc/default/grub
fi

grub-mkconfig -o /boot/grub/grub.cfg
systemctl enable NetworkManager
systemctl enable sshd


read -p "The ordinary user's username:" user

line=" %wheel ALL=(ALL) ALL"; sed -i "/^#$line/ c$line" /etc/sudoers
line="[multilib]"; sed -i "/^#$line/ c$line" /etc/pacman.conf
line="Include = \/etc\/pacman.d\/mirrorlist"; sed -i "/^#$line/ c$line" /etc/pacman.conf

useradd -m -G wheel $user
echo " --> Setting the password for $user"
passwd $user
echo " --> Setting the password for root"
passwd
