+++
title = "taking vagrant and running with it"
date = "2012-08-28"


Categories = []
+++

Over past few weeks I've been working on doing some integration and
testing work to try and deliver a prototype system. I've taken the
[Vagrant](http://vagrantup.com/) tool and puppet to try and deliver
systems for testing and development. Although the systems that I am
currently working with aren't fully automated, they are automated
enough for them to be easily started up by a developer who reads the
documentation (I hope).

I'm hoping that by providing these disposable systems that the various
members in the team that I am working with will be more free to experiment
and less fearful of breaking the system. At best everyone will take the
idea on board and run with it as it does provide a common environment
for all members in the team and it encourages reproducibility of issues
and features.

One of the next steps of building up the development framework that I
now have is to introduce some of these concepts and the whole Vagrant
environment to the more front facing part of the team who need to deal
with stakeholders in the project. If our requirements and policy team have
constant up to date access to our development, testing and QA environment
along with the executable specifications (in the form of cucumber tests)
I hope to push forward communications between the stakeholders and the
team that I'm working with.

For now I have one VM for the application itself and a number of
"clusters" of VM's which I had used for reviewing some technical
documentation, they are partially automated for others to
play with. Currently these scripts are internal to the project
only, but it's not hard to setup if you know how to configure
[puppet](http://puppetlabs.com/). Some of the scripts and ideas can
be found at [tchpc-vagrant](https://github.com/jcftang/tchpc-vagrant),
they're not great, but not bad either. I need more of the developers in
the team to use what I've setup to evolve the system more for our use.

In parallel to using this for my day job, I've
also setup a Vagrantfile for one of my pet projects
[cports](https://github.com/jcftang/cports). Using Vagrant for testing
builds and deployments of a packaging system has been great. I've been
able to do clean rebuilds of various packages without fear of completely
polluting the enviroment, as its just a few commands away from being
redeployed and provisioned. I'll need to play more and then release it
to the HPC community (or those that care).
