+++
title = "building a private cloud with saltstack as the cloud controller"
date = "2013-12-31T12:55:26+00:00"


categories = []
+++

After going to SC13 and being at a few BoF's and hearing
some people talk about their operations and potentially using
[Salt](http://www.saltstack.com/) to replace the likes of puppet and chef,
I decided to learn a little more about Salt.

In particular since I have an old laptop lying around at
home, I decided to setup a little private cloud. I followed this [blog
post](http://www.saltstack.com/salt-blog/2013/11/19/cloud-making-doesnt-have-to-be-so-hard-salt-virt-tutorial).

It mostly worked apart from some buggy behaviour in the seeding
process. It was certainly lower overhead in setting a salt managed
'cloud' than setting up a full on [Open Nebula](http://opennebula.org/)
instance or even openstack.

It's pretty neat that a provisioned VM reports into the salt master
and is ready to be provisioned pretty quickly when it boots up. I can
certainly see the attraction of using Salt to setup a private cloud with
Salt as the controller.

In short compared to [Ansible](http://www.ansibleworks.com/) Salt is a
bit more heavy weight than Ansible. I haven't done any like with like
comparisons but I do feel that Salt seems like the better option for
maintaining long running systems and Ansible is great for rapid redeploys
of systems (from a clean state)

I've uploaded the configs that I have been using at home to github, they
can be found [here](https://github.com/jcftang/salt-virt), there's even a
few packer templates to build base images for CentOS 6.5 and Ubuntu 12.04.
