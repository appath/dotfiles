# ARCH Btrfs
Elevator

Hungry Pacman, trough

It is worth noting that the pictures take up a lot of space.

You can use BTRFS for the root file system with the exception of / boot, which must be formatted in a traditional journaling file system.

One for Boot and the other one will be a btrfs partition with subvolumes.
```shell
$ mkfs.btrfs -f -L PC /dev/sda
```
(VB name Disk)
```shell
$ mkfs.btrfs -f -L VB /dev/sda1 
```

We mount:
```shell
$ mount /dev/sda1 /mnt
```

Create a subtotal:
```shell
$ btrfs subvolume create /mnt/root
$ btrfs subvolume create /mnt/home
$ btrfs subvolume create /mnt/snapshots
```
Unmount:

Compression (lzo), gives an increase in space saving plus improves performance, and defragmetation in the background.

We mount:
```shell
$ umount /mnt
$ mount -o subvol=root,noatime,space_cache,clear_cache,compress=lzo,autodefrag /dev/sda1 /mnt
```
Same
```shell
$ mkdir /mnt/{boot,home,.snapshots}
$ mount -o subvol=home,noatime,space_cache,clear_cache,compress=lzo,autodefrag /dev/sda1 /mnt/home
$ mount -o subvol=snapshots,noatime,space_cache,clear_cache,compress=lzo,autodefrag /dev/sda1 /mnt/.snapshots
```
* ssd 

Turn on some of the SSD optimized behaviour within btrfs.

* autodefrag

Will detect random writes into existing files and kick off background defragging.

* noatime

Under read intensive work-loads, specifying noatime significantly improves performance because no new access time information needs to be written.

* compress=lzo

Faster compression.

* clear_cache 

Clear all the free space caches during mount. This is a safe option, but will trigger rebuilding of the space cache, so leave the 
filesystem mounted for some time and let the rebuild process finish. If the process btrfs-freespace is actively doing some IO, it's 
probably not finished yet. This mount option is intended to be used one time and only after you notice some problems with free space.

* space_cache

Btrfs stores the free space data on-disk to make the caching of a block group much quicker. It's a persistent change and is safe to boot
into old kernels.

* subvol

Mount a subvolume instead of the root subvolume.

Install Basic Packages:
For example
```shell
$ pacstrap /mnt base base-devel grub zsh vim git
```
Checking cat
```shell
$ cat /mnt/etc/fstab
```
We enter
(machine_name - Name of your machine)
```shell
$ arch-chroot /mnt
$ echo machine_name > /etc/hostname
```
Edit Locals
(#Uncomment.)
```shell
$ vim /etc/locale.gen
```
en_US.UTF-8 UTF-8

Generate locales:
```shell
$ locale-gen
```
Ram-Disc
```shell
$ vim /etc/mkinitcpio.conf
```
HOOKS="keymap, remove fsck"

![scrot](https://raw.githubusercontent.com/appath/ARCH-Dotfiles/master/HOOKS.png)

```shell
$ mkinitcpio -p linux
```
Select the time zone
```shell
ln -sf /usr/share/zoneinfo/** /etc/localtime
```
```shell
$ grub-install /dev/sda
$ grub-mkconfig -o /boot/grub/grub.cfg
$ passwd root
$ exit
$ reboot
```
Successfully...

On the run {
```shell
$ systemctl enable dhcpcd
$ systemctl start dhcpcd
```
}

Creating snapshots
```shell
$ btrfs subvolume snapshot -r / /.snapshots/root-`date +%F-%R`
```
To check the dump
```shell
$ btrfs subvolume list
```
Note that each subsection has its own ID number.

And recover from the snapshot
```shell
$ mount /dev/sda2 /mnt
$ btrfs subvolume delete /mnt/root`
$ brtfs subvolume snapshot /mnt/snapshots/root-2017-05-16-20:19 /mnt/root
```
Restart the machine 20.5500

The function of creating snapshots in BTRFS is implemented quite accurately, and its use does not present any difficulties.

ArchWiki [Snapper](https://wiki.archlinux.org/index.php/Snapper)
