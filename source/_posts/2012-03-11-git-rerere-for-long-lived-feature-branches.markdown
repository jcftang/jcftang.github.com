---
layout: post
title: "git rerere for long lived feature branches"
date: 2012-03-11 11:45
comments: true
external-url: http://progit.org/2010/03/08/rerere.html
categories: linux scm
---

I turned this feature on for a few of my git repos but I had
completely forgotten about it. As far as I recall the feature has been
around for a few years now. It can be turned on globally by doing

    git config --global rerere.enabled 1

It pretty much automates of the conflict resolutions in long lived
branches. I've been lazy recently and I have just doing merges instead
rebasing, which lead me to re-discover _git rerere_.
