+++
title = "adding an osd to a ceph cluster"
date = "2012-09-04"


categories = []
+++

Having created a small single node Ceph cluster with following the [5 minute quickstart](http://ceph.com/docs/master/start/quick-start/) guide I was able to create a single node cluster with one OSD.

This probably wouldn't be the first post that someone has written about this topic.

I've verified that it works in my test environment of Scientific Linux
6 by mounting the system with FUSE.

Here's my *fstab* to describe my disk layout

	# /etc/fstab
	# Created by anaconda on Fri Jul  6 14:27:56 2012
	#
	# Accessible filesystems, by reference, are maintained under '/dev/disk'
	# See man pages fstab(5), findfs(8), mount(8) and/or blkid(8) for more info
	#
	/dev/mapper/vg_ceres-lv_root /                     ext4    defaults,user_xattr        1 1
	UUID=4eb5efad-dbcd-4a9f-8187-d8ffa913e147 /boot    ext4    defaults        1 2
	/dev/mapper/vg_ceres-lv_home /data1                ext4 defaults,user_xattr        1 2
	/dev/sdb /data                                     ext4 defaults,user_xattr        1 2
	/dev/mapper/vg_ceres-lv_swap swap                  swap    defaults        0 0
	tmpfs                   /dev/shm                tmpfs   defaults        0 0
	devpts                  /dev/pts                devpts  gid=5,mode=620  0 0
	sysfs                   /sys                    sysfs   defaults        0 0
	proc                    /proc                   proc    defaults        0 0

Running a *df -h* gives this

	$ df -h
	Filesystem            Size  Used Avail Use% Mounted on
	/dev/mapper/vg_ceres-lv_root
			       50G  5.5G   42G  12% /
	tmpfs                 938M     0  938M   0% /dev/shm
	/dev/sda1             485M   80M  380M  18% /boot
	/dev/sdb              230G  1.2G  217G   1% /data
	ceph-fuse             230G   13G  217G   6% /mnt
	/dev/mapper/vg_ceres-lv_home
			      176G  188M  167G   1% /data1

I'm using an old desktop machine so I can plonk some "files" on it so I
can dogfood the test system in administering the bits and pieces of Ceph.

Here's my current Ceph configuration (before I add a new OSD)

	[global]
		#auth supported = cephx
		#keyring = /etc/ceph/ceph.keyring
		filestore xattr use omap = true

	[osd]
		osd journal size = 1000
		filestore xattr use omap = true

	[mon.a]
		host = x.y.z.194
		mon addr = x.y.z.194:6789
		mon data = /data/mon.$id
	[mds.a]
		host = x.y.z.194
		mon data = /data/mds.$id

	[osd.0]
		host = x.y.z.194
		osd data = /data/osd.$id
		osd journal = /data/osd.$id.journal

I was a little caught out by the *osd journal* setting, I did not realise
that I needed to set this value if I set a journal size.

So to add a new OSD to a running system I followed the instructions at
<http://ceph.com/docs/master/ops/manage/grow/osd/>. This involves
allocating a new OSD id, editting the ceph.conf file, formatting the
OSD then adjusting the CRUSH map to allocate data to the new OSD.

	ceph osd create
	1

I then added these lines to my ceph.conf file (as this is my test system,
I've ignored all sensible naming conventions)

	[osd.1]
		host = x.y.z.194
		osd data = /data$id/osd.$id
		osd journal = /data$id/osd.$id.journal

I then create the directory for osd.1

	mkdir /data1/osd.1

Once the above is done, I need to initialise the osd data directory,
this can be done with the following command.

	ceph-osd -i 1 --mkfs

As I am not using any authentication (for now) I do not bother with keys
and the such.

With the above done, one can verify that the OSD has been added to the
system by executing the following command

	# ceph osd tree
	dumped osdmap tree epoch 10
	# id    weight  type name       up/down reweight
	-1      1       pool default
	-3      1               rack unknownrack
	-2      1                       host x.y.z.194
	0       1                               osd.0   up      1

	1       0       osd.1   down    0

Once the osd is in the cluster, it must be added to the CRUSH map. Given the above, the command that I need to execute would be

	ceph osd crush set 1 osd.1 1.0 pool=default rack=unknownrack host=x.y.z.194

Running the osd tree command again will show that I have added the OSD to my host

	# ceph osd tree
	dumped osdmap tree epoch 11
	# id    weight  type name       up/down reweight
	-1      2       pool default
	-3      2               rack unknownrack
	-2      2                       host x.y.z.194
	0       1                               osd.0   up      1
	1       1                               osd.1   down    0

However the state is down for _osd.1_, it must be brought up before it
is usable. It can be brought up by doing,

	# service ceph -a start osd
	# ceph osd tree
	dumped osdmap tree epoch 13
	# id    weight  type name       up/down reweight
	-1      2       pool default
	-3      2               rack unknownrack
	-2      2                       host x.y.z.194
	0       1                               osd.0   up      1
	1       1                               osd.1   up      1

If I do a _df -h_ I should see an increase in the space that is available.

	# df -h
	Filesystem            Size  Used Avail Use% Mounted on
	/dev/mapper/vg_ceres-lv_root
			       50G  5.5G   42G  12% /
	tmpfs                 938M     0  938M   0% /dev/shm
	/dev/sda1             485M   80M  380M  18% /boot
	/dev/sdb              230G  1.2G  217G   1% /data
	ceph-fuse             405G   23G  382G   6% /mnt
	/dev/mapper/vg_ceres-lv_home
                      176G  1.2G  166G   1% /data1

Given that I have in the past administered GPFS and Lustre filesystem
in production, this doesn't look too bad. I don't know the system that
well, but the configuration is pretty sensible and straight forward.

It's no harder than GPFS where one needs to create an NSD, then add the
NSD to a GPFS filesystem, nor is it more harder than just *mounting*
and OST in Lustre.

There does seem to be one or two additional things that a Ceph admin
would need to know before they can admin it optimally. However from the
initial playing around it looks like it needs more documentation, for
the seasoned parallel/distributed sysadmin this system is pretty neat
and tidy. However for the less experienced it looks like it might be a
bit hard to grasp some of the concepts before one can be an effective
admin of Ceph.

Now that I've gone through the process of adding an OSD to my small test
cluster, I think the next thing to try is to play with the CRUSH map to
see if I can get Ceph replicate data between my OSD's even though
they are on the one machine. I guess the place to look at next is
<http://ceph.com/wiki/Adjusting_replication_level>

Without getting into the finer details of all this, in GPFS you can only
have a replica size of 1 or 2 and you can only play with failure groups
of NSD's and nodes. GPFS does a lot to hide things from the admin, this
is probably a good thing. Lustre doesn't allow replicas at all (or
raid1). As powerful as Ceph is, I would imagine at some point someone
will ask "can I just have a tool to set the replica count assuming I
have configured my machines and OSD lists accordingly"

However the sysadmin in me just wants documentation as Ceph seems to
be almost ready for competing against GPFS and Lustre (as well as the
other parallel and distributed file systems).
