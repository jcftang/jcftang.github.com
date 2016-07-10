+++
title = "thoughts on using the likes of tahoe lafs and git annex as a backend storage system for digital preservation"
date = "2012-07-05"


Categories = []
+++

Having happily running and using both git-annex and tahoe-lafs in the
past year or so to manage my files and backups. I've been thinking
about plugging in tahoe-lafs as a backend driver for iRODS. I never
quite got around to doing it properly, I had only gotten the universal
mass storage driver to talk to tahoe-lafs. I was planning on writing
an MSO driver for iRODS to talk to tahoe-lafs's web-api, but alas I
never got around to it. I need to get some interns to do it next year!

It's still highly attractive to have tahoe-lafs at the storage backend
due to its erasure coding capabilities to maximise a return on
investment in the storage infrastructure. I'm not sure if anyone has
really tried to use something like tahoe-lafs as a backend for digital
preservation.

There are a few niggling issues with tahoe-lafs which may prevent one
from using it in digital preservation, one is the lack of
precedence. Someone needs to take a first step at trying to see if it
works or not. Personally I would like to see the multi-introducer work
to be production ready and released, this would hugely increase the
availability of a tahoe-lafs grid and would mitigate the need for
trying make one introducer node highly available and redundant and of
course local network performance could be better. I've never really
been able to get more than 10-20mbit/s out of a download/upload. If my
transfers are queued up and running in the background it's not a major
issue.

Which brings me to git-annex, all the new fancy features that the
author of git-annex has been adding has been fantastic. I've setup a
"target" which is a tahoe-lafs grid which I use a replica set for one
of my annex'd collection of files. It's not the fastest thing in the
world for transfers but at least I know my data is safe in at least
two places.

Having used git-annex happily for the past while and being interested
in the S3 and SWIFT interfaces that git-annex is able to talk to has
made me wonder if it's a good idea to try and create a fedora-commons
backend/remote for git-annex or a real tahoe-lafs backend/remote that
doesn't rely on the general hook system that git-annex already
has. Also the Internet Archive provides an S3/SWIFT like interface.

Or would it be better to go the other way around and try using
git-annex as a type of interface to other backend storage systems for
fedora-commons, I wish I had more time to poke the akubra
interface/package in fedora-commons.

The above is just a rant and my brain spewing random stuff out in the
afternoon after thinking about the OR2012 developer challenge.
