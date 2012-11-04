---
layout: post
title: "There is light on the otherside"
date: 2012-11-04 19:52
comments: true
external-url: 
categories: team scm dri linux
---

Having spent the best part of my Sunday afternoon playing with ansible
just to learn and see what all the fuss is about, I was pleasantly
surprised with it.

I had installed [ansible](https://github.com/ansible/ansible) on my OSX
laptop and [vagrant-ansible](https://github.com/ansible/vagrant-ansible)
for my vagrant test environment.

The plan was to try and re-create my current ruby on rails development
and test virtual machine with vagrant. A secondary goal was to get it
to work with both Ubuntu Precise (LTS) and Scientific Linux 6.

My attempt at doing the above can be found at
[tchpc-vagrant](https://github.com/jcftang/tchpc-vagrant/tree/ansible)
in the ansible branch. You will need ansible installed on your host
machine. You don't need much installed in the target machine as ansible
is designed to login and execute commands as required, this is quite
refreshing. Compared to puppet and chef, if I were to roll this out
into production my overhead will be pretty low. This low overhead is
something that I really like as I don't need to setup an infrastructure
just to run puppet.

In short I was able to learn how ansible is supposed to work (I think)
and build up enough configuration to start up a vagrant vm with what I
need for to do rails development in a matter of hours.

One thing that did occur to me was the lack of windows support, given
that ansible is designed to use ssh to carry out its activities, finding
stock windows machines which run ssh is pretty slim. This is one area
which puppet (perhaps chef too) is better at. It's also one feature that
I would like as the vagrant vm's that we're using in work might be given
to windows users for testing and evaluation.

Going forward I think ansible will certainly be in my toolkit. There really is
a light on the otherside for mangement, deployment and orchestration.
