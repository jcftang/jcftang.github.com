---
layout: post
title: "MOSH - An alternative to SSH"
date: 2012-04-17 08:31
comments: true
external-url: http://mosh.mit.edu/
categories: 
---

This tool hasn't been around for too long, but long enough to make it
into quite a few distros. It looks like it's a good alternative to
_autossh_ and _tmux_ which I have been using for the past few
years. Like many new tools like this, if it's not around everywhere
it's not as useful as it could be.

The only minor criticism of the application is that the _mosh_ command
itself is written in perl, it would be nicer if the wrapper command
would be written in C/C++ like the rest of the application. It would
certainly make it more _portable_. I guess I should shut up or write
my own mosh wrapper replacement.

Other than that, I've got it installed on one or two machines and it
seems nice enough so far. I now need to test it out in the field on a
bad connection when I'm away at a team meeting. I'm still not entirely
sure of how good or bad it is in terms of security compared to _SSH_.
