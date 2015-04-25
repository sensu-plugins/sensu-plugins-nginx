# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

# cent_script = <<EOF
# sudo yum update -y
# sudo yum groupinstall -y development
# sudo yum install -y vim nano
# gpg2 --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
# curl -L get.rvm.io | bash -s stable
# source /home/vagrant/.rvm/scripts/rvm
# rvm reload
# rvm install 2.1.4
# rvm use 2.1.4@sensu_plugins --create
# rvm use 2.1.4@sensu_plugins --default
# EOF

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define 'cent5' do |cent5|
    cent5.vm.box = 'chef/centos-5.11'
    cent5.vm.provision 'shell', inline: script, privileged: false
  end

  config.vm.define 'cent6' do |cent6|
    cent6.vm.box = 'chef/centos-6.6'
    cent6.vm.provision 'shell', inline: script, privileged: false
  end

  config.vm.define 'cent7' do |cent7|
    cent7.vm.box = 'chef/centos-7.0'
    cent7.vm.provision 'shell', inline: script, privileged: false
  end

  config.vm.define 'ubuntu14' do |ubuntu14|
    ubuntu14.vm.box = 'chef/ubuntu-14.04'
    # ubuntu14.vm.provision 'shell', inline: script, privileged: false
  end

  config.vm.define 'ubuntu12' do |_ubuntu14|
    ubuntu12.vm.box = 'chef/ubuntu-12.04'
    # ubuntu12.vm.provision 'shell', inline: script, privileged: false
  end

  config.vm.define 'freebsd92' do |bsd9|
    bsd9.vm.guest = :freebsd
    # The below line is needed for < freebsd9x only
    bsd9.ssh.shell = '/bin/sh'
    bsd9.vm.box = 'chef/freebsd-9.2'

    # Use rsync in place of shared folders
    bsd9.vm.synced_folder '.', '/vagrant', type: 'rsync'
    # bsd9.vm.provision 'shell', inline: script, privileged: false
    bsd9.synced_folder_type = 'rsync'
  end

  config.vm.define 'freebsd10' do |bsd10|
    bsd10.vm.guest = :freebsd
    bsd10.vm.box = 'chef/freebsd-10.0'

    # Use rsync in place of shared folders
    bsd10.vm.synced_folder '.', '/vagrant', type: 'rsync'
    # bsd10.vm.provision 'shell', inline: script, privileged: false
    bsd10.synced_folder_type = 'rsync'
  end
end
