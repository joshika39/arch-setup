#!/bin/bash
pacstrap /mnt base linux${1} linux-firmware linux${1}-headers openssh base-devel networkmanager
