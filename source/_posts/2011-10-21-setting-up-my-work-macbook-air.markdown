---
layout: post
title: "Setting up my work Macbook Air"
date: 2011-10-21 08:21
comments: true
categories:
 - osx
 - macports
---

Everytime when I install, reinstall or setup a mac desktop or laptop I
always tend to install the same set of software that I was using. As time
goes on I change what I like to install and what to use. So I've been
keeping notes and logs of that I usually install first.

For my new job I will mainly be writing documents, writing/modify JAVA
code and other bits and pieces that an integrator/architect or release
engineer might want to do.

I will be trying to automate builds, automate tests, assert that the
software must function as expected and so on.

So down to the list of the things that I have initially installed:

## Binary packages 

Packages that I just grabbed from their respective websites

* Xcode
* JDK - apple developer site
* Google Chrome
* GitHub Mac
* Macports
* Eclipse - classic
* Perian
* iTerm2

## Ruby related packages

* rvm
* showoff
* git-scribe

## Macports

* keychain
* git-core
* ikiwiki
* shiftit
* emacs-app
* bash-completion
* mercurial
* mr
* ffmpeg
* mplayer-devel
* dcraw
* detox
* dos2unix
* asciidoc
* fossil
* zsync
* macvim
* aria2
* openssh
* org-mode
* tmux

The Macports list isn't exactly complete, but it's pretty close to
what I had explicitly installed. Sadly I tried to install gcc45 and
gcc46 because I wanted to play with some codes which needed a fortran
compiler, this failed to install due to some bootstrapping issue of
the fortran compiler during the build.

I've yet to install Haskell and some of the related tools which are
pretty handy for a lazy user. There is also the need for installing
Office for OSX. I wish I could just use plain text.

At somepoint I should grab my previous lists and see what I have
added/removed to my toolbox over the years. So far Lion hasn't been
too bad, but I have yet to develop anything or seriously tried to do
anything too technical on this system so far.
