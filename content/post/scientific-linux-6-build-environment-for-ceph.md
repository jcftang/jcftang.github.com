+++
title = "scientific linux 6 build environment for ceph"
date = "2012-09-02"


Categories = []
+++

After my last failed attempt at [Installing Ceph on
SL6](/2012/07/06/installing-ceph-on-sl6/) or rather my attempt at
configuring Ceph for a test failed miserably.

It hasn't deterred me to test more. As a result I setup a number of
Vagrant Virtual machines and got together a few puppet scripts to
provision machines.

Here's a sample manifest for puppet to automate the deployment of a
machine to build Ceph. It requires that you SL6 environment to have at
least the epel repository enabled.

<pre><code>
# -*- mode: ruby -*-
# vi: set ft=ruby :

#
# template for tchpc site, there are dependancy issues with proxies
#
node /ceph.*\.localhost/ inherits default {
	# install needed packages
        # generic devel tools and libraries
        if ! defined(Package['nfs-utils']) { package { 'nfs-utils': ensure =&gt; installed } }
	if ! defined(Package['boost-devel']) { package { 'boost-devel': ensure =&gt; installed } }
	if ! defined(Package['epel-release']) { package { 'epel-release': ensure =&gt; installed } }
	if ! defined(Package['expat-devel']) { package { 'expat-devel': ensure =&gt; installed } }
	if ! defined(Package['fuse']) { package { 'fuse': ensure =&gt; installed } }
	if ! defined(Package['fuse-devel']) { package { 'fuse-devel': ensure =&gt; installed } }
	if ! defined(Package['gcc']) { package { 'gcc': ensure =&gt; installed } }
	if ! defined(Package['gcc-c++']) { package { 'gcc-c++': ensure =&gt; installed } }
	if ! defined(Package['keyutils-libs-devel']) { package { 'keyutils-libs-devel': ensure =&gt; installed } }
	if ! defined(Package['libaio-devel']) { package { 'libaio-devel': ensure =&gt; installed } }
	if ! defined(Package['libatomic_ops-devel']) { package { 'libatomic_ops-devel': ensure =&gt; installed } }
	if ! defined(Package['libcurl-devel']) { package { 'libcurl-devel': ensure =&gt; installed } }
	if ! defined(Package['libedit-devel']) { package { 'libedit-devel': ensure =&gt; installed } }
	if ! defined(Package['libtool']) { package { 'libtool': ensure =&gt; installed } }
	if ! defined(Package['libuuid-devel']) { package { 'libuuid-devel': ensure =&gt; installed } }
	if ! defined(Package['libxml2-devel']) { package { 'libxml2-devel': ensure =&gt; installed } }
	if ! defined(Package['nss']) { package { 'nss': ensure =&gt; installed } }
	if ! defined(Package['nss-devel']) { package { 'nss-devel': ensure =&gt; installed } }
	if ! defined(Package['rpmdevtools']) { package { 'rpmdevtools': ensure =&gt; installed } }
        if ! defined(Package['git']) { package { 'git': ensure =&gt; installed } }

	# these two are form EPEL
	if ! defined(Package['gperftools-devel']) { package { 'gperftools-devel': ensure =&gt; installed } }
	if ! defined(Package['fcgi-devel']) { package { 'fcgi-devel': ensure =&gt; installed } }

	# turn on avahi so we can do things like  "ssh ceph00.local" between the vm's
	include avahi

	# take the vagrant key for now and use it for passwordless ssh configs
        ssh_authorized_key { "root":
                ensure =&gt; "present",
                type =&gt; "ssh-rsa",
                key =&gt; "AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ==",
                name =&gt; "vagrant insecure public key",
                user =&gt; "root",
        }

        file { "/root/.ssh/id_rsa":
                mode =&gt; "0600",
                owner =&gt; "root",
                group =&gt; "root",
                source =&gt; "puppet:///modules/insecure-keys/insecure_private_key" ,
                require =&gt; Ssh_authorized_key["root"],
        }

        file { "/root/.ssh/config":
                mode =&gt; "0600",
                owner =&gt; "root",
                group =&gt; "root",
                source =&gt; "puppet:///modules/insecure-keys/insecure_config",
                require =&gt; Ssh_authorized_key["root"],
        }

	# the follow is done so the vagrant user can be used for testing and development without needing to su to the cephuser account
	file { "/home/vagrant/.ssh/id_rsa":
		mode =&gt; "0600",
		owner =&gt; "vagrant",
		group =&gt; "vagrant",
		source =&gt; "puppet:///modules/insecure-keys/insecure_private_key" ,
	}

	file { "/home/vagrant/.ssh/config":
		mode =&gt; "0600",
		owner =&gt; "vagrant",
		group =&gt; "vagrant",
		source =&gt; "puppet:///modules/insecure-keys/insecure_config",
	}

	# define the hosts in /etc/hosts
	host { 'ceph00': ip =&gt; '10.0.1.130', host_aliases =&gt; 'ceph00', }
	host { 'ceph01': ip =&gt; '10.0.1.131', host_aliases =&gt; 'ceph01', }
	host { 'ceph02': ip =&gt; '10.0.1.132', host_aliases =&gt; 'ceph02', }

	# disable selinux
	class { 'selinux':
		mode =&gt; 'disabled',
	}
}
</code></pre>

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
