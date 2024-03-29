# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.define "leap", primary: true do |leap|
    # Every Vagrant development environment requires a box. You can search for
    # boxes at https://atlas.hashicorp.com/search.
    leap.vm.box = "opensuse/Leap-15.3.x86_64"

    # Create a private network, which allows host-only access to the machine
    # using a specific IP.
    #leap.vm.network "private_network", ip: "192.168.33.10"
    leap.vm.network "private_network", type: "dhcp"

    # The hostname the machine should have.
    # Defaults to nil. If nil, Vagrant will not manage the hostname.
    # If set to a string, the hostname will be set on boot.
    leap.vm.hostname = "leap"

    leap.vm.provision "ansible" do |ansible|    ansible.playbook = "server/vagrant/playbook.yml"  end
    leap.vm.provider "virtualbox" do |vb|
      vb.memory = 4096
      vb.cpus = 3
    end
  end

  config.vm.define "tumbleweed" do |config|
    config.vm.box = "opensuse/Tumbleweed.x86_64"
    # Enable provisioning with a shell script. Additional provisioners such as
    # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
    # documentation for more information about their specific syntax and use.
    config.vm.provision "ansible" do |ansible|    ansible.playbook = "server/vagrant/playbook.yml"  end
    config.vm.network "private_network", type: "dhcp"
    config.vm.hostname = "tumbleweed"
    config.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
      vb.cpus = 1
    end
  end
end
