+++
title = "crowbar for deploying systems"
date = "2012-10-27"


categories = []
+++

I've been eyeing [crowbar](https://github.com/dellcloudedge/crowbar)
recently, it looks pretty useful and interesting for deploying servers
and applications. I haven't seen much if at all any documentation out
there which suggests that people in the digital preservation and archiving
fields are implementing systems at scale, I'm under the impression that
most systems/sites are building systems up one piece at a time without
much automation.

It seems to use [chef](http://www.opscode.com/chef/) in the backend for
all the automation. I've been relearning [puppet](http://puppetlabs.com/)
recently so that I can have reproducible environments with
[Vagrant](http://vagrantup.com/).

There might be an advantage to learn and port all the existing modules
that I have already created and configured to chef instead of puppet. If
I did move to a chef automation in my vagrant environments then a few
years from now when we go to full production we might be able to deploy
the whole system from bare metal relatively quickly and repeatably.

Automating the deployments will mean that we will have documentation
on the infrastructure itself. Either which way there is still a need
to automate the fedora-commons, SOLR, mysql and postgres deployments at
some point.

After all this thinking and pondering, I'm still using puppet. There's
still the likes of ansible, cfengine, bcfg2 and juju. There is a never
ending supply of these tools.
