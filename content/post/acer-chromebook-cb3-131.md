+++
date = "2016-08-01T10:26:34+01:00"
description = ""
tags = ["linux", "chromebook"]
title = "Acer Chromebook 11in, CB3-131"
topics = []
+++

I recently picked up a cheap Acer Chromebook 11inch - CB3-131. It
runs Chome OS. While it's nice as a machine that just works for
small things and travel. I found the environment to be a bit
restrictive (less fun) to play with. I did try
[crouton](https://github.com/dnschneid/crouton), but it wasn't what
I had hoped for.

I proceeded to investigate installing a full linux distro onto my
Chromebook and discovered that on some (the one that I got) has a
physical write protect screw on the mainboard. I proceeded to take
it apart and compared it to some photos of the older [CB3-111](https://plus.google.com/photos/+RyanSchelske/albums/6125754696828294017/6125754695280265442?pid=6125754695280265442&oid=109699564062072057954) model.
I then proceeded to remove the write protect screw which I think
is this one (circled in red). The layout of the board hasn't changed
much if at all, so it's a pretty safe bet.

![](/CB3-131.jpg)

I've yet to try installing a linux like [GalliumOS](https://galliumos.org/)
or just straight up Debian/Ubuntu. It seems the BayTrail chipset
is less supported than the Haswell/Broadwell based Chromebooks.
