+++
title = "dris workflows just got uploaded to github"
date = "2012-05-21"


Categories = []
+++

After almost 3 months supervising and working with two interns I've
finally uploaded their work under the GPLv2 License.

* <https://github.com/jcftang/dri-api>
* <https://github.com/jcftang/dris-workflows>
* <https://github.com/jcftang/dris-workflows-site>
* <https://github.com/jcftang/node-dri>
* <https://github.com/jcftang/node-fedora>

Please note that the packages above do not represent DRI at all, they
just ended up getting labelled that way for whatever reason.

So what are the above packages? Well they are an attempt at creating a
workflow for the DRIS team in TCD who work on digital preservation,
digitisation, cataloging and a host of other tasks which I probably
don't know about.

The prototype system consists of the DRIS Workflows package and the
API server. The system currently target the problem of ingesting
objects. It tries to map what the librarians/archivists at TCD are
doing to a single interface to increase throughput and quality of the
work (amongst other things).

It's also able to export the internal meta-data as Dublin-Core, it's
not great right now and requires more work and there is a small start
made on MODS as well. It does demonstrate what the interns managed to
achieve in 3 months time with a loose spec on what needed to be
done. The basic design and architecture of the system isn't too
different from Hydra, it was very much by accident that we ended up
some similar ideas.

The primary purpose of this post is to share the code! and as per
usual, hope someone finds it useful.
