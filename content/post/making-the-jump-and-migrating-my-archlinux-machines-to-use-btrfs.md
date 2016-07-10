+++
title = "making the jump and migrating my archlinux machines to use btrfs"
date = "2013-01-02"


Categories = []
+++

Having a few days of time off from work I've committed to migrating my
archlinux based laptops to using btrfs. I've to date been just using
ext4 and nilfs2 (on an SD card) on my eeepc and plain old ext4 on the
bigger laptop.

The main motivation was that the two devices were pretty outdated and
I felt lucky with doing a major upgrade (replaced sysvinit with systemd
as recommended by the archlinux people)

I didn't want to reinstall my machines so I took the route of converting
the existing ext4 partitions to btrfs. I left my _/boot_ partition as
ext2 for safety. Prior to converting to btrfs I had upgraded the two
laptops to using [grub2](https://wiki.archlinux.org/index.php/Grub2)
first. I then proceeded to boot up my laptops with the
archlinux installer image via a usb key. Then just followed the
[btrfs](https://wiki.archlinux.org/index.php/Btrfs) documentation at
the archlinux wiki.

The process went more smoothly than I had anticipated, I didn't run into
any major stumbling blocks, that said I did have to free up some space
for the migration to occur.

Once the systems were back up and running I enabled compression on btrfs
and defragged the systems

	find / -xdev -type f -print -exec btrfs filesystem defrag '{}' \;

This compression feature made a huge difference on the space limited
eeepc, the compression feature reclaimed about 10% of the space on the
system. It's a shame that the RHEL based distros aren't quite supporting
btrfs yet there are quite a few nice features there that are very
attractive for pro-consumers and the enterprise. RHEL7 will have btrfs,
hopefully there will be backports to RHEL6.

Performance wise I haven't used the system in anger yet, so time will
tell if I'm happy with btrfs or not.
