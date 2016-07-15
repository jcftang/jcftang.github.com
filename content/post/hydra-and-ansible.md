+++
title = "hydra and ansible"
date = "2013-06-06T18:11:40+01:00"


categories = []
+++

The team that I am working with right are very much agile and we're
doing quite a bit of outside in development of the repository that we're
building. We're mostly adopting a behaviour driven development with a
touch of test driven development. As a result we're very much in favour
of testing things out as much as we can and using the same environments
to develop against. As previously mentioned before I had originally
been using puppet and vagrant to build up the development harness and
experiment with tools/services that we might want to use for our system.

At somepoint I came across [ansible](http://www.ansible.cc) and not long
after discovering it, I migrated a large chunk of the development and
test systems to using ansible. I've even cooked up one or two ansible
modules as a result.

As a result of adopting ansible for building up our test and development
infrastructure, I've collected the relevant playbooks and roles that a
person might want for deploying all the bits and pieces needed to roll
out a hydra-head. See <https://github.com/jcftang/ansible-hydra>, I have
a set of roles and a few example playbooks on setting up at least

* Tomcat (from the base repositories of RHEL6/Centos6/ScientificLinux6)
* Fedora-Commons (the same version as is in the hydra-jetty repo)
* Apache SOLR (the same version as is in the hydra-jetty repo)
* Ruby (via RVM) in a user directory
* Passenger with the installed version of Ruby
* MySQL (from the base repositories of RHEL6/Centos6/ScientificLinux6)
* Redis

The configurations aren't quite production ready yet as they do require
some more work in setting up Fedora-Commons and SOLR the way we want. The
configurations are however fairly realistic and are daily use
for doing test deployments of our hydra-head (RoR application) or
experimenting with additional tools, configurations and systems such as
[ceph](https://github.com/jcftang/ansible-ceph) - we're using the radosgw
to provide a realistic and local S3 service.

So far the configurations need polishing off and another playbook needs
to be created for continuous deployment of our hydra-head.
