#! /bin/bash

# Ponemos la distribucion QWERTY español

loadkeys es

# Sincronizamos red pero antes comprovamos

ping -c 4 google.com
timedatectl set-ntp true
pacman -Syy

# Ahora formateamos particiones

mkfs.ext2 /dev/sda1
mkfs.ext4 /dev/sda2
mkfs.ext4 /dev/sda3
mkswap /dev/sda4

# Y a continuacion lo montamos

mount /dev/sda2 /mnt
mkdir /mnt/boot
mkdir /mnt/home
mount /dev/sda1 /mnt/boot
mount /dev/sda3 /mnt/home

lsblk

# Para terminar el script instalamos el sistema

pacstrap /mnt base base-devel linux linux-firmware nano grub networkmanager lightdm lightdm-gtk-greeter qtile virtualbox-guest-utils

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt
