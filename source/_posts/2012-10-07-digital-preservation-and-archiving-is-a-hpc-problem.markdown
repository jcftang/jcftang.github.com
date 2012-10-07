---
layout: post
title: "Digital Preservation and Archiving is a HPC problem?"
date: 2012-10-07 13:42
comments: true
external-url: 
categories: hpc storage
---

I shall be going to SC2012 next month, I plan on hitting a few of the
storage vendors for possible collaborations and flagging to them that
we're on the look out for storage systems. One of the first
observation that the reader will note is "where is that link between
HPC and Digital Preservation and Archiving". It's probably not obvious
to most people, one of the big problems in the area of preservation
and archiving is the the amount of data involved and the varied types
of data. This is not taking into account of the issues with data
access patterns.

Given that a preservation and archiving project will want to provide a
trusted system, the system will want to read out every single byte
that was put in to verify that the data is correct at somepoint
(usually with some form of hashing).

Reading data out and checking that it's correct serially probably
isn't the smartest solution. Nor is copying the data into 2-3
locations (where each site is maintaining 2-3 copies for backups and
redundancy). The current and seemingly most popular solutions is to
dump the data to a few offsite locations (such as S3 or SWIFT)
compatible storage systems, then just hoping for the best that if
anyone of the sites is down or corrupted there site can be restored
from the other sites or from a backup. I need to delve deeper into the
storage and data-distribution strategies that some of the bigger
projects are taking. There has to be a smarter way of storing and
preserving data without having to make copies of things.

I've often wondered how projects manage to copy/move data across
storage providers in a reasonable amount of time without needing to
wheel a few racks of disks around. It would also be interesting to see
the error rates of these systems and how often errors are
corrected. If they are corrected what is the computational cost of
doing this.

If you have a multi-terabyte archive the problem isn't too bad, the
more typical case these days might be in the order of the low hundreds
of terabytes. I could only imagine what lager scale sites must deal
with. I'm still not a fan of moving a problem from a local site to a
remote site as it often shows that there is a lack of understanding to
the problem. Storage in the preservation and archiving domain will
probably turn into an IO and compute intensive operation at some
point, especially if you want to do something with the data.
