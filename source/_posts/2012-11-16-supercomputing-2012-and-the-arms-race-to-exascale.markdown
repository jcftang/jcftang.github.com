---
layout: post
title: "Supercomputing 2012 and the arms race to exascale"
date: 2012-11-16 06:30
comments: true
external-url: 
categories: hpc storage linux
---

It was clear at this year's supercomputing conference that there wasn't
as much excitement as previous years. There wasn't much surprise as
nothing too revolutionary and radical was announced. In the past when
Bluegene/L and P arrived after the earth simulator there was an arms race
to being number 1 in the top500 list.  Even things like GPGPU's aren't
as cool anymore, everyone is selling effectively the same systems when
it comes to clusters. Not everyone has the budget to procure a specialist
machine like a NEC vector machine, a CRAY, Bluegene/Q etc...

The arms race to the top is just completely crazy, the top 50 or so
machines are so powerful compared to what a typical university or small
research lab might have access is too is completely skewed. At our site
we're probably about 0.5% of the top machine. In the past we were about
1-2% typically of the top machine, and we were about 5yrs behind the
curve. The top 500 list should really be renamed to the top 50 list and
the green 500 list or the HPCC list should be used instead as a measure
of the top machines in the world. Do people really think that LINPACK
is a good measure of how powerful a machine is going to be?

What was interesting at this year's conference was some of the papers
and panels were focused on project management and data management of
scientific datasets. I noticed that when people are starting to worry
about meta-data standards like librarians, people are starting to think
about archiving the data, they probably haven't thought about the access
component of preservation which will be amusing when they do realise
it. There is also a disconnect from some of the papers which focused on
silent data corruption at the storage and network layers. The archiving
and preservation space for HPC will need to deal with bit-flips, silent
data corruption, malicious users and all that funk that is related to it.

After having a few chats with some vendors during the week, /me eyes
them vendors. There seems to be a bit of a lack of understanding that
archiving and preservation of data isn't just about bulk, cheap and
reliable storage. There are apects to it which require data processing and
analytics of the data. It seems somewhat pointless to archive data and not
index it, process it and deliver it to who needs it. At somepoint the data
will be touched for checksumming, surrogate generation, delivery to the
end user. There also seems to be a lack of a guarantee of data-integrity
at the filesystem level. It appears that this responsiblity is left to
the application developer.

Would storage vendors (filesystems, devices the whole stack!) please
consider providing end to end data integrity? If the guys at the top are
trying to reach exascale computing in the next 5 years then the storage
component needs to catch up. Other sectors would also benefit from the
end to end data integrity built into storage systems.
