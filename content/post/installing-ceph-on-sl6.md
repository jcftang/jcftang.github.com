+++
title = "installing ceph on sl6"
date = "2012-07-06"


Categories = []
+++

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
that I have yet to go through. Perhaps the configuration of ceph can go
into another post.

To start the cluster after it's configured

	service ceph -a start

However on my test system it's currently crashing out with the mds server giving the followin errors

	2012-07-06 16:38:17.838055 7f2d6828d700 -1 mds.-1.0 *** got signal Terminated ***
	2012-07-06 16:38:17.838139 7f2d6828d700  1 mds.-1.0 suicide.  wanted down:dne, now up:boot
	2012-07-06 16:38:17.839020 7f2d6828d700 -1 osdc/Objecter.cc: In function 'void Objecter::shutdown()' thread 7f2d6828d700 time 2012-07-06 16:38:17.838156
	osdc/Objecter.cc: 221: FAILED assert(initialized)

	 ceph version 0.48argonaut (commit:c2b20ca74249892c8e5e40c12aa14446a2bf2030)
	 1: (Objecter::shutdown()+0x170) [0x6e2e20]
	 2: (MDS::suicide()+0xc9) [0x4ad829]
	 3: (MDS::handle_signal(int)+0x1bb) [0x4b447b]
	 4: (SignalHandler::entry()+0x283) [0x803d53]
	 5: /lib64/libpthread.so.0() [0x3b3ea077f1]
	 6: (clone()+0x6d) [0x3b3e6e5ccd]
	 NOTE: a copy of the executable, or `objdump -rdS <executable>` is needed to interpret this.

	--- begin dump of recent events ---
	    -3> 2012-07-06 16:37:57.786954 7f2d6b496760  0 ceph version 0.48argonaut (commit:c2b20ca74249892c8e5e40c12aa14446a2bf2030), process ceph-mds, pid 12537
	    -2> 2012-07-06 16:38:17.838055 7f2d6828d700 -1 mds.-1.0 *** got signal Terminated ***
	    -1> 2012-07-06 16:38:17.838139 7f2d6828d700  1 mds.-1.0 suicide.  wanted down:dne, now up:boot
	     0> 2012-07-06 16:38:17.839020 7f2d6828d700 -1 osdc/Objecter.cc: In function 'void Objecter::shutdown()' thread 7f2d6828d700 time 2012-07-06 16:38:17.838156
	osdc/Objecter.cc: 221: FAILED assert(initialized)

	 ceph version 0.48argonaut (commit:c2b20ca74249892c8e5e40c12aa14446a2bf2030)
	 1: (Objecter::shutdown()+0x170) [0x6e2e20]
	 2: (MDS::suicide()+0xc9) [0x4ad829]
	 3: (MDS::handle_signal(int)+0x1bb) [0x4b447b]
	 4: (SignalHandler::entry()+0x283) [0x803d53]
	 5: /lib64/libpthread.so.0() [0x3b3ea077f1]
	 6: (clone()+0x6d) [0x3b3e6e5ccd]
	 NOTE: a copy of the executable, or `objdump -rdS <executable>` is needed to interpret this.

	--- end dump of recent events ---
	2012-07-06 16:38:17.840237 7f2d6828d700 -1 *** Caught signal (Aborted) **
	 in thread 7f2d6828d700

	 ceph version 0.48argonaut (commit:c2b20ca74249892c8e5e40c12aa14446a2bf2030)
	 1: /usr/bin/ceph-mds() [0x803309]
	 2: /lib64/libpthread.so.0() [0x3b3ea0f4a0]
	 3: (gsignal()+0x35) [0x3b3e632885]
	 4: (abort()+0x175) [0x3b3e634065]
	 5: (__gnu_cxx::__verbose_terminate_handler()+0x12d) [0x3b432bea7d]
	 NOTE: a copy of the executable, or `objdump -rdS <executable>` is needed to interpret this.

	--- begin dump of recent events ---
	     0> 2012-07-06 16:38:17.840237 7f2d6828d700 -1 *** Caught signal (Aborted) **
	 in thread 7f2d6828d700

	 ceph version 0.48argonaut (commit:c2b20ca74249892c8e5e40c12aa14446a2bf2030)
	 1: /usr/bin/ceph-mds() [0x803309]
	 2: /lib64/libpthread.so.0() [0x3b3ea0f4a0]
	 3: (gsignal()+0x35) [0x3b3e632885]
	 4: (abort()+0x175) [0x3b3e634065]
	 5: (__gnu_cxx::__verbose_terminate_handler()+0x12d) [0x3b432bea7d]
	 NOTE: a copy of the executable, or `objdump -rdS <executable>` is needed to interpret this.

	--- end dump of recent events ---

I've logged the error message on the ceph-devel mailing list, I don't
have time to poke at this problem right now. I need to recreate this
scenario in a VM on my laptop so I can play with this on the plane when
I'm going to Open Repositories 2012 this weekend.
