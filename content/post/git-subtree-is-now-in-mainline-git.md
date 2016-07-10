+++
title = "git subtree is now in mainline git"
date = "2012-05-02"


Categories = []
+++

It seems that [git-subtree](git://github.com/apenwarr/git-subtree.git)
has been merged into the mainline git project. _git-subtree_ is one of
those really useful wrappers for manipulating git repositories if you
are an integrator or don't really like git-submodule. It certainly is
a nicer alternative to git-submodule. There is less chance of the
person cloning a git-subtree repository messing up the checkout because
they forgot to initialise the submodules. There is also the added
advantage of not needing to fiddle around scripting up the git-archive
commands for exporting the source tree for a release if you use
git-subtree; actually git-subtree is just plain useful.
