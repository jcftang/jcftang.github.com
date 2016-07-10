+++
title = "hashdist for repeatably building an environment"
date = "2014-06-22T14:52:42+01:00"


Categories = []
+++

I've been happily hacking at some packages for
[hashdist](https://hashdist.github.com), it's pretty nice, there
other build systems out there for dealing with building applications
and libraries with different combinations of compilers and numerical
libraries. Out of the lot I think hashdist has been the most satisfying
to use so far. It's still missing some bits and pieces to allow users
to use different compilers for key components (or everything).

Without explaining too much, it's basically taking inputs which define
a package and then generating an output hash to store the output of the
build. This means that as you modify the the environment and rebuild, it
will install the updated packages into a different location. Traditionally
I would have just overwritten the old versions or install it into a named
directory, then setup a module file for it etc... with hashdist there
is less messing around. It doesn't fully solve the problem of having
multiple versions of the software available at any one point in time,
but it does let you have many versions installed and you can create
different inputs profiles to get access to the 'builds'. This means you
can version control your environment, it also means you can roll back
to a previous environment if something is broken or wrong.
