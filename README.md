[![GitHub](M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0 0 16 8c0-4.42-3.58-8-8-8z)

![scrot](https://raw.githubusercontent.com/appath/dotfiles/master/GitBox_0000_18_05_2017_13_55_02.png)

# Notes ARCH Btrfs Snapshots
Elevator

Installing the btrfs-progs package.

Hungry Pacman, trough

It is worth noting that the pictures take up a lot of space.

You can use BTRFS for the root file system with the exception of / boot, which must be formatted in a traditional journaling file system.

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
$ btrfs subvolume create /mnt/@BUILD
$ btrfs subvolume create /mnt/@root
$ btrfs subvolume create /mnt/@home
$ btrfs subvolume create /mnt/@snapshots
```
Unmount:

Compression (lzo), gives an increase in space saving plus improves performance, and defragmetation in the background.

We mount:
```shell
$ umount /mnt
$ mount -o subvol=@root,noatime,space_cache,compress=lzo /dev/sda1 /mnt
```
Same
```shell
$ mkdir /mnt/{BUILD,home,.snapshots}
$ mount -o subvol=@BUILD,noatime,space_cache,compress=lzo /dev/sda1 /mnt/BUILD
$ mount -o subvol=@home,noatime,space_cache,compress=lzo /dev/sda1 /mnt/home
$ mount -o subvol=@snapshots,noatime,space_cache,compress=lzo /dev/sda1 /mnt/.snapshots
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

Successfully...

Creating snapshots
```shell
$ btrfs subvolume snapshot -r / /.snapshots/@home-`date +%F-%R`
```
To check the dump (/ . -p)
```shell
$ btrfs subvolume list -p .
```
Note that each subsection has its own ID number.
```shell
$ cd ../..
$ rm -rf *
```
And recover from the snapshot
```shell
$ mount /dev/sda1 /mnt
$ btrfs subvolume delete /mnt/@home
$ brtfs subvolume snapshot /mnt/@snapshots/@home-2017-05-16-20:19 /mnt/@home
```
Restart the machine 20.5500

The function of creating snapshots in BTRFS is implemented quite accurately, and its use does not present any difficulties.

ArchWiki [Btrfs](https://wiki.archlinux.org/index.php/Btrfs) | Tool helps with sub-volumes and thin LVM volumes [Snapper Utility](https://wiki.archlinux.org/index.php/Snapper)
