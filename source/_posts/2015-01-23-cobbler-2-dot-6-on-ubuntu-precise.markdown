---
layout: post
title: "Cobbler 2.6 on Ubuntu Precise"
date: 2015-01-23T19:28:55+00:00
comments: true
external-url: 
categories: linux
---

I've recently went and updated a bunch of things that I'm working
with, and one of the things I decided to refresh was an automated
installer. In the past I've relied on either hand rolled configurations
or more recently Ubuntu [MAAS](https://maas.ubuntu.com/). This time
I decided to give [Cobbler](http://www.cobblerd.org/) a try on my
Ubuntu Precise installations.

Given Cobbler is pretty (or was) RHEL specific, I was not too
disappointed with the Debian packaging. Most things worked, I did
have to correct the dnsmasq and tftpd templates but it mostly worked.
I've a smallish salt formula for setting up said system at
<https://github.com/jcftang/cobbler-formula>

It's pretty nice that Cobbler is able to provision KVM or XEN based
virtual machines as well as the usual bare metal systems.
