+++
title = "amazon redshift a curiousity to me"
date = "2013-03-24T11:16:54+00:00"
tags = []


categories = []
+++

I've been recently reading up on Amazon [Redshift](), at first I thought
it was a parallel/distributed datastore like HDFS. At a second look in
reality its more of a distributed relational database. This in itself
is pretty cool for scaling applications with large data sets that happen
to need to be in a database; which is quite a few things.

From the initial reading of the architecture and docs, it looks like
Amazon built a job queuing system around postgres to schedule queries
out to its nodes in the cluster. What's curious to me is how do they
deal with failed nodes in the system and how they provision the system,
there must be an ordered set of operations to do so.

Another oddity is the mesh network that the system has, I'm under the
impression that there is only 1x10gb network connection on the machine. I
wonder if the mesh network is just a virtual mesh network or if it's
really a real physical one. If it's a real physical mesh network then
each machine would require more than one network interface. It would
also be a cabling nightmare to build such a device and if Amazon has
built a large scale mesh network of machines, that would be pretty cool.
I wonder how much of the Redshift user base are latency, bandwidth or
compute bound when looking at large datasets; or if its really just the
challenge of having one real big database that can be queried.

[Redshift]: http://docs.aws.amazon.com/redshift/latest/dg/welcome.html
