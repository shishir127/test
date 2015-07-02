# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

Vagrant.require_version '>= 1.5.0'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = 'test-berkshelf'
  if Vagrant.has_plugin?("vagrant-omnibus")
    config.omnibus.chef_version = 'latest'
  end
  config.vm.box = 'chef/ubuntu-14.04'
  #config.vm.network :private_network, type: :dhcp
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.berkshelf.enabled = true

  config.vm.provision :chef_zero do |chef|
    chef.node_name      = 'test'
    chef.cookbooks_path = ['.chef/cookbooks']
    chef.nodes_path     = '.chef/nodes'
    chef.roles_path     = '.chef/roles'
    chef.data_bags_path = '.chef/data_bags'

    chef.add_recipe 'test'
  end
end
