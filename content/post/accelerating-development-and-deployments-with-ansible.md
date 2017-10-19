+++
title = "accelerating development and deployments with ansible"
date = "2013-08-01T21:38:54+01:00"
tags = ["linux", "ansible"]

categories = []
+++

It's probably no secret that we use Ansible at our work place for
the project that I am working on. So far we've used it to deploy and
maintain state for our Open Nebula deployment, Jenkins CI system, Ceph's
radosgw and our digital repository.

In fact I currently have a Jenkins job which deploys our software stack
using Ansible to a test system in our Open Nebula cluster. This has been
hugely beneficial to myself so far to be able to teardown and bring up
systems quickly to make sure our application is well tested and debugged.

Without going into a huge amount of detail, we've been able to deploy our
systems with relative ease and repeatability. I've got the configurations
up at my github account for those that are interested.

The best thing about these deployments is that the initial prototyping
was done in a set of vagrant managed virtual machines, this allowed me
to rapidly bring up and teardown systems to ensure we have everything
automated smoothly. On the flipside, the systems that get developed for
production usage get backported to our vagrant setup. This means that
we're able to provide a development environment for each developer which
is identical or as close as possible to our production systems.

Having the capability to develop and test on a local machine which is
close to or identical to our production system has accelerated our bug
finding and development process.

I'm not too sure what the team think, since we're moving quite fast and
Ansible has allowed us to do so due to its ease of use, well it has at
least let me do so anyway.
