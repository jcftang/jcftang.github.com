---
layout: post
title: "Why Linux isn't the only platform to target when building applications"
date: 2012-02-16 09:33
comments: true
external-url: 
categories: linux osx scm
---

Why would one want to target other platforms when building applications
on the server side? 

This came out of a conversation with the ex-CTO of Creme software (he
is also a friend of mine), the conversation started out with why I
like to use Macs and OSX as my laptop or workstation. I've been a long
time Linux user of pretty much most of the major distributions ranging
from RHEL, Debian/Ubuntu, Gentoo, ArchLinux as well as a number of
other derivatives, not to mention other systems like the BSD's which I
have a soft spot for. 

I interchange the terms Linux and Distros quite a bit in this post.

Some of the things that didn't like with the Linux's was that not all
my hardware would be supported all the time, the distro's sometimes
think that it's a good idea to completely change how lowlevel systems
work in favour of _what's hot right now_, sometimes the lack of long
term support for security updates (not package updates to fix security
problems) does make it more difficult to plan and deploy. The
perceived flexibility sometimes causes headaches with migration plans
and maintanence.

Of course there are things that I like, the access to the source code
and packaging to fix and redeploy packages. The stability and
reliability that can be achieved is attractive if everything is
automated and planned out (though too much automation can be bad too).

To get back to the original point of why you wouldn't want to target
Linux specifically when building applications? Unless you have a
strong motivating reason to write code that _specifically_ requires a
feature of Linux (or any other operating system), then you really
ought to be writing code that adheres to at least some POSIX or cross
platform standard, and pick libraries that are known to have good
cross platform compatibility. There is nothing to gain from writing
platform specific codes in the long run, the platform might hide
issues from the developer if it is too clever. Linux or more
specifically the distros might change various behaviour of the
underlying system, and if your code is tied down to particular
features of the underlying system then you will have lots of fun
migrating.

It's just bad practice to rely on system specific behaviour which
isn't portable (or maintainable) going forward in a project. To
mitigate some of this, one would want to at least try to use a
continuous build systems such as _gitbuilder_, _buildbot_ or _jenkins_
on a bunch of __different__ architectures and platforms. This will
reveal portability issues and more often than not, subtle bugs in your
code which you probably didn't see as a result of your development
system being too smart for you!

There isn't much of an excuse not to do continuous builds and testings
across different Linux, BSD and Solaris distributions these
days. Diskspace and compute power is cheap, there are free and
opensource virtualisation technologies out there to provide you with a
means to run different distributions for testing on a single
machine. The problem will be the upfront manpower needed to setup such
a system.

In the long run targetting at least two platforms will make your code
base far more portable and hopefully more maintainable as you will end
up making sure you write code once that runs on many systems with
minimal changes needed when a new platform arises.
