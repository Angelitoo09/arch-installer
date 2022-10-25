#! /bin/bash

loadkeys es
ln -sf /usr/share/zoneinfo/Europe/Madrid /etc/localtime
hwclock --systohc
nano /etc/locale.gen
locale-gen
echo LANG=es_ES.UTF-8 >> /etc/locale.conf
echo KEYMAP=es >> /etc/vconsole.conf
passwd
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
nano /etc/hostname
useradd -m -g users -G audio,lp,optical,storage,video,wheel,games,power,scanner -s /bin/bash angel
passwd angel
EDITOR=nano visudo
