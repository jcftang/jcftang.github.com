---
layout: post
title: "Installing Ceph on SL6"
date: 2012-07-06 14:43
comments: true
external-url: 
categories: linux storage
---

As an exercise of a Friday afternoon of not starting something big before
heading off to a conference. I've decided to spend an hour or two at
seeing how ceph is installed and configured on an SL6 based machine
(RHEL6 clone).

The install target is just an old desktop running a 64bit install of SL6x,
so it's nothing too fancy.

Following the instructions at <http://ceph.com/wiki/Installing_on_RedHat_or_CentOS>, I ended up doing this

	yum install yum-conf-epel
	yum update
	yum gcc gcc-c++ automake libtool expat expat-devel boost-devel nss-devel cryptopp cryptopp-devel libatomic_ops-devel fuse-devel
	yum install libedit-devel libedit

It seems that the packages _cryptopp-devel_, _cryptopp_ and _expat-devel_,
_expat_ are the only packages pulled in from the epel repository.

Additional libraries and tools include these weren't mentioned in the
upstream wiki, the upstream wiki probably needs to be updated.

	yum install rpm-build
	yum install libaio-devel libcurl-devel libxml2-devel libuuid-devel keyutils-libs-devel fcgi-devel

I chose to install the newly designated stable branch of ceph 0.48argonaut

	wget http://ceph.com/download/ceph-0.48argonaut.tar.bz2

I also chose to build it in RPM form, in the tarball there is a RPM spec
file which can be used to create an installable RPM, the following is
a transcript of what I did to build an installable RPM.

	tar xjvf ceph-0.48argonaut.tar.bz2
	cp ceph-0.48argonaut.tar.bz2 ~/rpmbuild/SOURCES
	rpmbuild -ba ceph-0.48argonaut/ceph.spec

The build will take *some* time, especially if you are using old
hardware. I ran into some minor packaging issues,

	diff -u ceph.spec.in.orig ceph.spec.in
	--- ceph.spec.in.orig	2012-07-06 15:38:59.298497719 +0100
	+++ ceph.spec.in	2012-07-06 15:39:45.423560177 +0100
	@@ -326,6 +326,8 @@
	/usr/sbin/rcceph
	%{_libdir}/rados-classes/libcls_rbd.so*
	%{_libdir}/rados-classes/libcls_rgw.so*
	+/sbin/ceph-disk-activate
	+/sbin/ceph-disk-prepare

	#################################################################################
	%files fuse

The above change need's to be applied to the _ceph_ spec file for the
RPM(s) to build successfully.

	ceph-0.48argonaut-6.el6.x86_64.rpm
	ceph-devel-0.48argonaut-6.el6.x86_64.rpm
	python-ceph-0.48argonaut-6.el6.x86_64.rpm
	librbd1-0.48argonaut-6.el6.x86_64.rpm
	librados2-0.48argonaut-6.el6.x86_64.rpm
	ceph-radosgw-0.48argonaut-6.el6.x86_64.rpm
	libcephfs1-0.48argonaut-6.el6.x86_64.rpm
	ceph-fuse-0.48argonaut-6.el6.x86_64.rpm

I chose to install *all* the RPM's that were generated for educational
purposes (used yum instead of the rpm commands so the dependancies are
sorted out for me), from the *rpmbuild/RPMS/x86_64* directory

	yum install ceph-0.48argonaut-6.el6.x86_64.rpm ceph-devel-0.48argonaut-6.el6.x86_64.rpm ceph-fuse-0.48argonaut-6.el6.x86_64.rpm ceph-radosgw-0.48argonaut-6.el6.x86_64.rpm libcephfs1-0.48argonaut-6.el6.x86_64.rpm librados2-0.48argonaut-6.el6.x86_64.rpm librbd1-0.48argonaut-6.el6.x86_64.rpm python-ceph-0.48argonaut-6.el6.x86_64.rpm

I then simply followed the 5 minute quick start guide at
<http://ceph.com/docs/master/start/quick-start/> to see if ceph would
start up. There is more documentation at <http://ceph.com/docs/master>
that I have yet to go through.
