---
layout: post
title: "A poor man's NAS device with Ceph"
date: 2012-09-23 08:59
comments: true
external-url: 
categories: ceph storage linux
---

Given that I have a number of old 64bit capable desktop machines and a
collection of hard drives at home, I could have run
[Tahoe-LAFS](https://tahoe-lafs.org/trac/tahoe-lafs) like I do in work
for backup purposes. In fact Tahoe works quite well for the
technically capable user.

Recently I've decided that I need a more central location at home to
store my photo collection (I love to take photos with my Canon DSLR
and Panasonic LX5). Traditionally I would have just fired up
[git-annex](http://git-annex.branchable.com/) to track the data and
then setup a number of remotes to store the data, where one of them
might be Tahoe-LAFS and the rest might be portable hard drives, remote
machines etc...

I could have gone with any number of distributed storage solutions
such as [GlusterFS](http://www.gluster.org/),
[iRODS](http://www.irods.org),
[xrootd](http://xrootd.slac.stanford.edu/),
[Lustre](http://wiki.lustre.org/index.php/Main_Page) or
[xtreemfs](http://www.xtreemfs.org/). I've worked with some of these
systems in production and toyed with others. Since this is for a home
system I can pick what I want and change it at will.

I probably have 2-3tb's of data to archive and store, I also want easy
access to my data so NFS or CIFS exports are required. It wouldn't be
unfeasible to acquire a few 2 or 3 terabyte drives for my old desktop
machine which would effectively provide me with a 2 or 3 terabyte
replicated data store. Given the amount of toying around and learning
about Ceph in my spare time I would expect that Ceph would provide me
with a pretty good "backend" system for storing my files and the
option of "migrating my data from one machine to another machine" by
adding and removing OSD's. The handiest feature for me will be the
capability of expanding and shrinking the system as I need.

There probably aren't many people who would want to setup something
like this for a home system, but it is an alternative to the usual
RAID or LVM setup.

Here's my proposed setup which I'm going to setup in the next few
spare weekends that I will have.

{% img /downloads/images/ceph-home.png %}

It would be great if Ceph offered some of of parity/erasure coding
instead of plain replication. I'm greedy and I want to maximise my
disks that I have, I wonder how low I can go on hardware with the Ceph
software.
