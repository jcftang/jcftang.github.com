+++
title = "osx kernel panics and virtualbox"
date = "2012-07-20"


categories = []
+++

Having discovered [vagrant](http://vagrantup.com/) and
[veewee](https://github.com/jedi4ever/veewee) recently at OR2012 I've
been building a few _boxes_ for our site for testing purposes. I've
had to relearn puppet to provision machines, but it's paying off. I've
been able to deploy 3-4 virtual machines with relative ease.

The only disappointment is the seemingly frequent and semi-random
kernel panics and crashes that I get on OSX (which is probably caused
by VirtualBox when I do lots of IO). It's making me rethink if I
really want to stick with OSX as my primary desktop OS in work. I may
have to revert back to using Linux at somepoint.

At least in Linux I know how to get a kdump out and debug the issue
but with OSX I'm not sure where I should begin to figure out what's
broken.
