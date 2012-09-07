---
layout: post
title: "Scientific Linux 6 build environment for Ceph"
date: 2012-09-02 10:50
comments: true
external-url: 
categories: linux storage ceph
---

After my last failed attempt at [Installing Ceph on
SL6](/2012/07/06/installing-ceph-on-sl6/) or rather my attempt at
configuring Ceph for a test failed miserably.

It hasn't deterred me to test more. As a result I setup a number of
Vagrant Virtual machines and got together a few puppet scripts to
provision machines.

Here's a sample manifest for puppet to automate the deployment of a
machine to build Ceph. It requires that you SL6 environment to have at
least the epel repository enabled.

{% include_code lang:ruby puppet/manifests/nodes/ceph.pp %}

Here's also a sample _Vagrantfile_ to get one started

{% codeblock Vagrantfile lang:ruby %}
# -*- mode: ruby -*-
# vi: set ft=ruby :

#
# For vagrant configuration options please go to http://vagrantup.com/v1/docs/index.html
#

Vagrant::Config.run do |global_config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  # We default to using SL which is a RHEL clone
  global_config.vm.box = "sl63-x86_64"
  global_config.vm.box_url = "http://thammuz.tchpc.tcd.ie/mirrors/boxes/scientificlinux-6.3-x86_64-netboot-devops.box"
  cephServers.each do |name, opts|
    global_config.vm.define name do |ceph|
      # uncomment the following line if you want the basebox to start in gui mode
      #ceph.vm.boot_mode = :gui
      ceph.vm.network :hostonly, opts[:network]
      ceph.vm.host_name = opts[:host_name]

      ceph.vm.provision :puppet, :facter => { "ceph_node_name" => "ceph@#{opts[:network]}" } do |puppet|
        puppet.manifest_file = "site.pp"
        puppet.manifests_path = 'puppet/manifests'
        puppet.module_path = ['puppet/modules', 'puppet/services']
        #puppet.options = "--verbose --debug"
      end

    ceph.vm.customize [
      "modifyvm", :id,
      "--name", opts[:host_name],
      "--memory", "1024"
    ]

    end
  end

end

{% endcodeblock %}

With the Virtual Machines I was able to download the latest [Ceph
0.51](http://www.ceph.com/download/ceph-0.51.tar.bz2) and do at least
the following

* unpack the tarball
* do a _./configure_ to generate the _ceph.spec_ file
* copy (or move) the ceph tarball into ~/rpmbuild/SOURCES
* execute a _rpmbuild -ba ceph.spec_ to build the source and binary rpm packages for installation

After the RPM's were built and installed, I again followed the quick
guide at <http://ceph.com/docs/master/start/quick-start/> and was able
to setup a small 3 node cluster for playing around with.

So to note, I tried out the cephfs feature (via the fuse module) and
creating(destroying and resizing) RBD's. I haven't had a chance to
experiment with the kernel modules to actually do something useful with
the POSIX filesystem or RBD's that Ceph provides.

It would be worth nothing that the Ceph project are working on providing
prebuilt RPM's soon, there is already a [gitbuilder instance for the rpm
build](http://ceph.com/gitbuilder-centos6-rpm-amd64/) or just go to their
[gitbuilder aggregator](http://ceph.com/gitbuilder.cgi)
