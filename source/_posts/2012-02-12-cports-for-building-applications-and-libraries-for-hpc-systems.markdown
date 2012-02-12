---
layout: post
title: "cports for building applications and libraries for HPC systems"
date: 2012-02-12 17:59
comments: true
categories: 
published: false
external-url: http://thammuz.tchpc.tcd.ie/mirrors/cports/releases/
---

I've talked about _cports_ in the past, it's basically a collection of
_makefiles_ which mostly automates the process of downloading,
configuring, building and installing applications and libraries for
High Performance Computing systems that use environment-modules.

One of the key-features that _cports_ offers is the automated
modulefile generation, and the fact that the _makefiles_ acts as
documentation to how software is configured, built and installed. It's
currently being used on the clusters at my work place, it has been a
boost to the productivity of the systems admin team. It's a nice
alternative to trying to create RPM's or DEB's (pick your custom
package manager of choice here), as _makefiles_ tend to be a little
more flexible than traditional package managers.

One main drawback of the _cports_ system right now is the lack of good
dependancy management and checking, it is all currently up to the
packager to resolve these dependancy issues. It's also _cports_
strongest point that there is no dependancy management, as the
packager can build many unique trees of packages.

For example, we have Tahoe-LAFS in the following sample makefile

```
include ../../../mk/gnu.pre.mk

DISTNAME=	allmydata-tahoe
VERSION=	1.9.0-SUMO
CATEGORIES=	system
HOMEPAGE=	http://tahoe-lafs.org/
MASTER_SITES=	http://tahoe-lafs.org/source/tahoe-lafs/releases/
MAINTAINER=	jtang@tchpc.tcd.ie
HAS_CONFIGURE=	no
DISTFILES = $(DISTNAME)-$(VERSION).tar.bz2

DEPENDS="Python/2.6.5 --build-env Python/2.6.5 --run-env"
DEPENDS+="openssl/0.9.8o --lib --build-env"
DEPENDS+="gmp/4.3.2 --lib --build-env"

DESCRIPTION=    "Tahoe-LAFS (Least Authority File System) is a Free Software/Open Source"
DESCRIPTION+=    "decentralized data store. It distributes your filesystem across multiple"
DESCRIPTION+=    "servers, and even if some of the servers fail or are taken over by"
DESCRIPTION+=    "an attacker, the entire filesystem continues to work correctly and to"
DESCRIPTION+=    "preserve your privacy and security."

CONFIGURE_ARGS +=

MODULEFILE_LINES+=      PYTHONPATH
MODULEFILE_CMD_PYTHONPATH?= \
        $(ECHO) "prepend-path   PYTHONPATH $(PROGRAM_PREFIX)/lib/python2.6/site-packages";

do-build:
	$(MODULE_ADD) $(BUILD_DEPENDS); \
	cd $(WRKSRC); \

do-install:
	$(MODULE_ADD) $(BUILD_DEPENDS); \
	cd $(WRKSRC); \
	$(MKDIR) $(PROGRAM_PREFIX) ;\
	tar -cpf - . | (cd $(PROGRAM_PREFIX)/ && tar -xpf - ) ;\
	cd $(PROGRAM_PREFIX) ;\
	cp -a tahoe-deps ../ ;\
	python setup.py build ;

do-test:
	$(MODULE_ADD) $(RUN_DEPENDS) $(DISTNAME)/$(VERSION)$(EXTRAVERSION)$(COMPILER_TAG) ; \
	cd $(WRKSRC); \
	python setup.py test

include ../../../mk/gnu.post.mk
```

In this example, as Tahoe-LAFS (upstream project) gets updated, the
cports packager just needs to copy this makefile to a new directory,
update the version numbers, then do a _make install_. This assumes
that the dependancies haven't changed much, if they have it is trivial
to update the dependancies. The above example generates a modulefile
similar to like this,

```
#%Module1.0
module-whatis "allmydata-tahoe version 1.9.0-SUMO (compiled with a gnu compiler)"
conflict allmydata-tahoe
prepend-path   PYTHONPATH /home/support/apps/cports/rhel-5.x86_64/gnu/allmydata-tahoe/1.9.0-SUMO/lib
/python2.6/site-packages
prepend-path PATH /home/support/apps/cports/rhel-5.x86_64/gnu/allmydata-tahoe/1.9.0-SUMO/bin
module add Python/2.6.5-gnu
proc ModulesHelp { } {
puts stderr "Tahoe-LAFS (Least Authority File System) is a Free Software/Open Source"
puts stderr "decentralized data store. It distributes your filesystem across multiple"
puts stderr "servers, and even if some of the servers fail or are taken over by"
puts stderr "an attacker, the entire filesystem continues to work correctly and to"
puts stderr "preserve your privacy and security."
puts stderr {build depends: gmp/4.3.2-gnu openssl/0.9.8o-gnu Python/2.6.5-gnu}
puts stderr {run depends: Python/2.6.5-gnu}
puts stderr {module depends: gmp/4.3.2 openssl/0.9.8o Python/2.6.5}
puts stderr {link depends: gmp/4.3.2-gnu openssl/0.9.8o-gnu}
}
prepend-path   PYTHONPATH /home/support/apps/cports/rhel-5.x86_64/gnu/allmydata-tahoe/1.9.0-SUMO/lib
/python2.6/site-packages
```

Once the package has been built and tested on a development system, we
can take the package and replicate the installation in fairly
automated fashion. This type of scripting and automation means that
the clusters that we run in work have consistent installations of
applications.

Having consistent installs means that the end-user needs to learn less
about the naming conventions. This in turn reduces the confusion and
documentation that is needed for the end user.