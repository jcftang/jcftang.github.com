+++
title = "is java really the only game in town for building digital preservation systems"
date = "2012-05-16"


Categories = []
+++

In the world of digital preservation and repositories it seems that
there is primarily fedora-commons, dspace, eprints and one or two
other solutions out there for building up digital preservation
systems. The one that really stands out as a framework and toolkit for
building bigger and more complex systems is fedora-commons.

It also happens to be written in JAVA and is a fairly big and complex
system which implements best-practices for storing digital objects
with the sole purpose of preservation. In one of the projects that I
have been working with some interns at work; we have treated
fedora-commons as just storage system where we interface to the
preservation repository via the available REST api.

By using the API it was possible to use node.js to implement the
servers which contained all the business logic. Project Hydra does
something similar or rather we are doing something similar to Project
Hydra, by accident much to my suprise. Hydra uses Ruby on Rails for
its middleware implementation, there doesn't seem to be much JAVA
there either.

I get the feeling that this decoupled approach with REST servers and
clients to be pretty attractive to anyone who wishes to implement
these types systems. It is interesting to see that the applications
aren't being written in JAVA. At least that is what I can see with the
projects that use Hydra (which is sort of the point). Maybe good
enough practice is fine for most use cases.

This makes me wonder how many digital preservation projects out there
really use 100% JAVA up to delivery to the client? How many projects
out there are really just mashups of different types of technology
(well planned mashups). Is it because of "best practice" for
implementing enterprise applications that JAVA gets so much focus and
attention?


