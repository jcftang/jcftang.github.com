+++
title = "using git daemon to share your git repo on a trusted lan"
date = "2012-07-02"


categories = []
+++

One of the things that I don't like about [git](http://git-scm.com/) is
the interface at times can be too geared towards power users. One command
that I particularly like in [mercurial](http://mercurial.selenic.com/)
is the _hg serve_ command, which is incredibly easy to use.

To do the equivalent of the _hg serve_ in _git_ you can do the following...

	user$ cd my-repo
	user$ git daemon --export-all --base-path=$(pwd)

The above assumes you are on a trusted network and you want to share
your repo with people on your LAN and you are in the toplevel directory
of the repository that you want to temporarily share. If you're lazy
you could do...

	user$ git config --global alias.serve 'daemon --reuseaddr --verbose  --base-path=. --export-all ./.git'

Which would place the following (or similar) in your ~/.gitconfig file

	[alias]
		serve = !git daemon --reuseaddr --verbose  --base-path=. --export-all ./.git

The above was taken from <https://git.wiki.kernel.org/index.php/Aliases>
