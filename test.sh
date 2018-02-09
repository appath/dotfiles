#!/usr/bin/env bash

# Installer ARCH
# it`s synthetic, makes it easy to install on the hard drive axis.
# vim :set fileformat=unix save :wq!

cyan='\e[0;36m'
green='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
blue='\e[1;34m'

again='y'
while [ $again == 'y' ] || [ $again == 'Y' ];
    do

clear
echo ""
echo -e $white"  This program is distributed in the hope that it will be useful"
echo -e $white"  But ($red"without any warranty"$white) script installer"
echo -e $white"  Run this Script Test after your first boot with $blue"ARCH"$white..."
echo ""
echo -e $white"  [$blue"01"$white]$cyan  Create disk partitions "
echo -e $white"  [$blue"02"$white]$cyan  We mount disk "
echo -e $white"  [$blue"03"$white]$cyan  Create subtopics "
echo -e $white"  [$blue"04"$white]$cyan  Compressions "
echo -e $white"  [$blue"05"$white]$cyan  Exit "
echo ""
echo -n '  Number: '; tput sgr0
read installer
echo ""

if test $installer == '1'
then
    echo
    info="Wait."
    echo -ne "Creating a partition and sub-sections"
    echo ${info}
    mkfs.btrfs -f -L linux /dev/sda
elif test $installer == '2'
then
    echo -ne "We mount /sdx"
    echo
    mount /dev/sda /mnt
elif test $installer == '3'
then
    echo -ne "We create two subtopics"
    btrfs subvolume create /mnt/root
    btrfs subvolume create /mnt/home
    echo -ne ${info}
    echo -ne "Umount /sdx"
    umount /mnt
elif test $installer == '4'
then
    echo -ne "Compression"
    mount -o subvol=root,compress=lzo,autodefrag /dev/sda /mnt
    echo -ne "Same"
    mkdir /mnt/home
    mount -o subvol=home,compress=lzo,autoderag /dev/sda /mnt/home
elif test $installer == '5'
then
clear
exit
fi
    echo
    echo -n -e " :: Back To Menu? [yes/no] ";
    read again;
        while [ $again != 'y' ] && [ $again != 'Y' ] && [ $again != 'n' ] && [ $again != 'N' ];
        do
    echo -n " :: Back To Menu [yes/no] ";
    read again;
    done
done
