---
layout: post
title: "Building Kelvin Supercomputer (time lapse)"
date: 2013-03-22T07:46:26+00:00
comments: true
external-url: http://www.youtube.com/watch?v=F0zon45WR-U&feature=youtu.be
categories: hpc team tcd
---

I was cleaning up some files and I found
this time lapse that I did when we were building
[Kelvin](http://www.tchpc.tcd.ie/resources/clusters/kelvin), it's a few
years old now. Even by current standards it's still pretty respectable.

[The timelapse](http://www.youtube.com/watch?v=F0zon45WR-U&feature=youtu.be)

We had to unpack and install all the infiniband cards ourselves, cabled,
racked, installed, configured and burnt it in for production usage. The
cluster has 100 nodes, each node has 2 sockets, each socket has 6 cores
and 24gb of ram.

The most interesting thing about this machine was that we got it with
QLogic infiniscale/infinipath HCA's and switching. It was one of the if
not the lowest latency networking that we could get at the time.

When we were configuring this system we had also redesigned the storage
system roughly around this period and went with a cluster to cluster
GPFS configuration.

Oh and we threw out the old cluster which was about 10racks of IBM e326
machines in the process.
