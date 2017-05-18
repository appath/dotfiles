![GitHub](https://raw.githubusercontent.com/appath/bin/master/favicons.png) 

Git @Caţ masẛ̣er ...

ArchLinux Btrfs SSD

![GitHub](https://raw.githubusercontent.com/appath/dotfiles/master/GitBox_0001_18_05_2017_13_55_02.png)

Packages:

* conky (conky_arch, conky_rss, conky_cc_gitstat)
* putty
* xterm
* git

( 
mkdir github/ "Create a folder on disk

git clone https://github.com/** "Copy your repository to your computer

"Make changes

"Git only tracks changes to files

"(Create, delete, edit)

"Git does not see created empty directories

"So that directories are stored on the server

"In empty directories you need the presence

"New, created or moved files in them

git add . "Indexing files for changes in them

git commit -m "update" "Fix the publication, comment on the changes

git push -f "Send to the GitHub server)


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
