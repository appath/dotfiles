# ARCH Btrfs


ssd 
Turn on some of the SSD optimized behaviour within btrfs.

noatime
Under read intensive work-loads, specifying noatime significantly improves performance because no new access time information needs to be written.

compress=lzo
Faster compression.

clear_cache 
Clear all the free space caches during mount. This is a safe option, but will trigger rebuilding of the space cache, so leave the 
filesystem mounted for some time and let the rebuild process finish. If the process btrfs-freespace is actively doing some IO, it's 
probably not finished yet. This mount option is intended to be used one time and only after you notice some problems with free space.

space_cache
Btrfs stores the free space data on-disk to make the caching of a block group much quicker. It's a persistent change and is safe to boot
into old kernels.

subvol
Mount a subvolume instead of the root subvolume.
