# ARCH Btrfs

(VB name Disk)
```shell
$ mkfs.btrfs -f -L VB /dev/sda 
```

We mount:
```shell
$ mount /dev/sda /mnt
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
$ mount -o subvol=root,noatime,space_cache,clear_cache,compress=lzo,autodefrag /dev/sda /mnt
```
Same
```shell
$ mkdir /mnt/{boot,home,.snapshots}
$ mount -o subvol=home,noatime,space_cache,clear_cache,compress=lzo,autodefrag /dev/sda /mnt/home
$ mount -o subvol=snapshots,noatime,space_cache,clear_cache,compress=lzo,autodefrag /dev/sda /mnt/.snapshots
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
![scrot](http://i.imgur.com/.png)

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
And recover from the snapshot
```shell
$ mount /dev/sda2 /mnt
$ btrfs subvolume delete /mnt/root`
$ brtfs subvolume snapshot /mnt/snapshots/root-2017-05-16-20:19 /mnt/root
```
Restart the machine 20.5500
[![GitHub](https://wiki.archlinux.org/index.php/Snapper) Snapper 
