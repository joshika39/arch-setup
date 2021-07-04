#!/bin/bash

# echo "pacstrap /mnt linux${1} linux${1}-headers"

pacstrap /mnt base linux${1} linux-firmware linux${1}-headers openssh base-devel networkmanager git sudo ntfs-3g nano vim
