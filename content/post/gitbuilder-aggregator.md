+++
title = "gitbuilder aggregator"
date = "2012-04-01"


categories = []
+++

We use git and [gitbuilder](https://github.com/apenwarr/gitbuilder) in
work for a large number of projects, we also try and test things as
much as we can. I first noticed that someone had written an aggregator
for gitbuilder at [ceph
gitbuilders](http://ceph.newdream.net/gitbuilder.cgi), this seemed
like a great idea (and it is) except the aggregator at the time didn't
quite work very fast and needed some ajax magic.

I had asked for a copy of the aggregator script from the ceph
developers, this was really just a perl hack as they said, but it
works. Since we had some students doing an internship here to learn
new things, I got one of the interns to write an ajax'd up version of
the aggregator.

After a few weeks worth of usage and minor changes, it's a bit more
ready to share with everyone, the ajax'd up version of the aggregator
can be found at my
[github](https://github.com/jcftang/gitbuilder/tree/develop/contrib/gitbuilder-ajax)
account in the develop branch. For fun I updated the main gitbuilder
cgi scripts to use twitter bootstrap and add a link to the errcache
file that gitbuilder generates.

We found that with large builds the logs would just swamp out the
errors and warnings and having access to the errcache helped a lot in
narrowing down where to look for problems, hence the linking to the
errcache.

At somepoint it might be worth re-implementing the gitbuilder scripts
in a single language in a generic way such that it works with other
DVCS's that have the bisect feature.
