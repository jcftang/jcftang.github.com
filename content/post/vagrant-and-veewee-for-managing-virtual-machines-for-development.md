+++
title = "vagrant and veewee for managing virtual machines for development"
date = "2012-07-17"


categories = []
+++

I only discovered [Vagrant](https://github.com/mitchellh/vagrant) last
week at OR2012 when one of the presentations had Vagrant as a part of
the testing component in the project. I was pleasantly surprised that
it was leaveraging lots of free and opensource technology to provide
repeatable environments for development and testing. I was even more
impressed by the [Veewee](https://github.com/jedi4ever/veewee) project
which provides some additional wrappers for building custom
'boxes'. Veewee certainly saved me lots of time in setting up some
updated [Scientific Linux](http://www.scientificlinux.org/) boxes
(it's my preferred distro for deployments).

In summary Vagrant is a set of scripts to manage virtual machines and
Veewee is a set of scripts for creating base images for use in
Vagrant. If you're interested in the updated SL6.2 definitions they
can be found at my
[fork of veewee](https://github.com/jcftang/veewee/tree/scientificlinux-6.2).

All that is left now is to setup [puppet](http://puppetlabs.com/) and
have it automatically provision my development/test environment. I'm
not a huge fan of puppet, but I guess it's better than rolling my own.

I look forward to have the capability of having easy access to
disposable VM's for prototyping and testing! I will need to at
somepoint setup a test system for cports with this tool.
