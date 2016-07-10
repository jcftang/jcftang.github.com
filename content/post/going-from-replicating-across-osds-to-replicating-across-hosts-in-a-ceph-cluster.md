+++
title = "going from replicating across osds to replicating across hosts in a ceph cluster"
date = "2012-09-06"


Categories = []
+++

Having learnt how to remove and add monitor's, meta-data and data servers (mon's, mds's
and osd's) for my small two node Ceph cluster. I want to say that it wasn't too hard to
do, the ceph website does have documentation for this.

As the default CRUSH map replicates across OSD's I wanted to try replicating data across
hosts just to see what would happen. In a real world scenario I would probably treat
individual hosts in a rack as a failure unit and if I had more than one rack of storage,
I would want to treat each rack as the minimum unit.

One of the coolest features of ceph is that it allows me to play with different mappings
and configurations of where my data gets allocated. There aren't many (if any) storage
systems that I know of which provides this type of capability.

So the steps that I went through to get to what I wanted...

First I had to dump the CRUSH map from my cluster of two nodes and three (very unbalanced OSD's so I can play with the weights).

	ceph osd getcrushmap -o /tmp/mycrushmap

The CRUSH map that is created is a binary file it must be decoded to plain text before
you can edit it.

	crushtool -d /tmp/mycrushmap > /tmp/mycrushmap.txt

Here's the map that is decoded from the binary file

	# begin crush map

	# devices
	device 0 osd.0
	device 1 osd.1
	device 2 osd.2

	# types
	type 0 osd
	type 1 host
	type 2 rack
	type 3 row
	type 4 room
	type 5 datacenter
	type 6 pool

	# buckets
	host x.y.z.194 {
	        id -2           # do not change unnecessarily
	        # weight 2.000
	        alg straw
	        hash 0  # rjenkins1
	        item osd.1 weight 1.000
	        item osd.0 weight 1.000
	}
	host x.y.z.138 {
	        id -4           # do not change unnecessarily
	        # weight 1.000
	        alg straw
	        hash 0  # rjenkins1
	        item osd.2 weight 1.000
	}
	rack rack-1 {
	        id -3           # do not change unnecessarily
	        # weight 3.000
	        alg straw
	        hash 0  # rjenkins1
	        item x.y.z.194 weight 2.000
	        item x.y.z.138 weight 1.000
	}
	pool default {
	        id -1           # do not change unnecessarily
	        # weight 2.000
	        alg straw
	        hash 0  # rjenkins1
	        item rack-1 weight 2.000
	}

	# rules
	rule data {
	        ruleset 0
	        type replicated
	        min_size 1
	        max_size 10
	        step take default
			step choose firstn 0 type osd
	        step emit
	}
	rule metadata {
	        ruleset 1
	        type replicated
	        min_size 1
	        max_size 10
	        step take default
	        step choose firstn 0 type osd
	        step emit
	}
	rule rbd {
	        ruleset 2
	        type replicated
	        min_size 1
	        max_size 10
	        step take default
	        step choose firstn 0 type osd
	        step emit
	}

	# end crush map

The relevant chunks of the config that I'm interested in is the **rule NAME {}** blocks.
As I'm interested in making my data, meta-data and probably my rbd rule replicate across hosts, I naturally made the rule look like this

	rule data {
	        ruleset 0
	        type replicated
	        min_size 1
	        max_size 10
	        step take default
			step choose firstn 0 type host
	        step emit
	}
	
The above change is apparently incorrect as the last step before the *step emit* needs
to be a device of some sort. I had found this out after posting the ceph-devel mailing
list. There were two proposed solutions (thanks to Greg from inktank), the first
proposed rule was

	rule data {
	        ruleset 0
	        type replicated
	        min_size 1
	        max_size 10
	        step take default
	        step choose firstn 0 type host
	        step choose firstn 1 osd
	        step emit
	}

Which selects *n* hosts then the first osd from each host, but it can't deal with an entire hosts failed OSD's. The second proposed rule was

	rule data {
	        ruleset 0
	        type replicated
	        min_size 1
	        max_size 10
	        step take default
	        step chooseleaf firstn 0 type host
	        step emit
	}

The above rule will select *n* hosts and an OSD from the host. It's pretty obvious that
the second rule is the one that I want. I would expect that if I had more machines in
racks and rows I could probably just replace host with rack, row or even data-center.

With the second proposed rule, I made the changes to *mycrushmap.txt*. Once the changes
are made, I had to compile the map into a binary format that the ceph cluster
understands, this can be done by

	crushtool -c /tmp/mycrushmap.txt -o /tmp/mycrushmap.new

Once the map is compiled it must then be applied to the cluster

	ceph osd setcrushmap -i /tmp/mycrushmap.new
	
The above is documented on the ceph website. Once I applied the new CRUSH map I ran a *ceph -w* to see that
the system had detected the changes and it then started to move data around on its own. I'll need to play
with pulling out the network cable or SATA cables to see how the system behaves from me causing catastrophic
failures in the test system.

I'm pretty sure I took the long way around to making the changes, there must be a more dynamic way of
changing the system.

To recap and review the above operation, it's again no harder than my reference system that I know, which is
GPFS. GPFS doesn't allow me to do what ceph allows me to do. I would however like to see some more visible
documentation relating to the CRUSH configuration parameters and tuneables.

So far this has been a distraction from my main day job, but this will certainly help
with the project that I am working on in the long run.
