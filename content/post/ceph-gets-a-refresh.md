+++
title = "ceph gets a refresh"
date = "2012-05-19"


categories = []
+++

I've been keeping an eye on _ceph_ for quite sometime now. It looks
like _ceph_ is almost ready for production usage. There is now a
support infrastructure and a commercial company backing the
product. So far the OSD, MDS and MON components all run on Linux since
most of the implementation appears to be in the user land I wonder if
it will be ported to non-linux platforms. It's be quite nifty if one
could have a heterogeneous network of servers providing storage.

From first glance at shadowing one of the guys in work with this
filesystem, it looks good. It's missing some documentation right now
apart from that it's going to be a great competitor in the distributed
filesystems arena. It will shake up GPFS and Lustre for sure, it might
even give glusterfs a run for its money in the near future.
