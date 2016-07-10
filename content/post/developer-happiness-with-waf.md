+++
title = "developer happiness with waf"
date = "2014-09-24T17:40:46+01:00"


Categories = ["python"]
+++

Having recently changed jobs (after a very long stint at TCD - just
short of 10yrs!) I’ve moved to a small startup. I’ve been working
on a few small bits and pieces of code, infrastructure, etc... I
had to make some stuff work and make it work well. So I decided to
use autotools to configure and build the application that I’m working
on.

As great as it was on my nice fast intel based machine, it was dog
slow on my target platform, especially when I had to regenerate the
autoconf scripts.

To get to the point, I ended up spending a day or two checking out
alternatives (that wasn’t cmake) and came across
[waf](https://code.google.com/p/waf/), the documentation isn’t all
that great if you just look at the website, I had to spend a few
hours digging around to get what I wanted.

Once I ported my application over to using waf, the configure and
build process was an order of magnitude faster than autotools. This
made a huge difference on my target platform. I noticed that waf
ships with some experimental plugins like the daemon plugin which
runs a build when it notices that somefiles have changed.

This daemon plugin is *great* it gives waf similar behaviour to
what java developers have with junit and eclipse. I’m finding that
waf is making me happy when I develop and fix stuff in the application
that I’m working on.
