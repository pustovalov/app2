# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Use Ubuntu 14.04 Trusty Tahr 64-bit as our operating system
  config.vm.box = "ubuntu/trusty64"
  # config.vm.network "private_network", ip: "10.10.195.90"
  # config.vm.network "public_network"

  # config.vbguest.auto_update = false
  # config.vm.synced_folder ".", "/vagrant", type: "nfs"


  # Configurate the virtual machine to use 2GB of RAM
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  # Forward the Rails server default port to the host
  config.vm.network :forwarded_port, guest: 3000, host: 3003

  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  # config.vm.provision :shell, :inline => 'sudo apt-get install libgmp3-dev -y'

  # Use Chef Solo to provision our virtual machine
  config.vm.provision :chef_solo do |chef|

    # chef.json.merge! rvm: {vagrant: {system_chef_solo: '/usr/bin/chef-solo'}}
    chef.cookbooks_path = ["chef/site-cookbooks", "cookbooks"]
    # chef.roles_path     = [[:host, "chef/roles"]]

    # chef.add_role "vagrant"

    chef.add_recipe "build-essential"
    chef.add_recipe "system::install_packages"
    chef.add_recipe "apt"
    chef.add_recipe "nodejs"
    chef.add_recipe "ruby_build"
    chef.add_recipe "rvm::system"
    chef.add_recipe "rvm::vagrant"
    chef.add_recipe "database::postgresql"
    chef.add_recipe "postgresql::ruby"
    chef.add_recipe "postgresql::client"
    chef.add_recipe "postgresql::server"
    chef.add_recipe "vim"

    # Install Ruby 2.3.0 and Bundler
    chef.json = {
      system: {
        packages: {
          install: ["libgmp3-dev"]
        }
      },
      rvm: {
        vagrant: {
          # system_chef_solo: "/opt/vagrant_ruby/bin/chef-solo"
          system_chef_solo: "/usr/bin/chef-solo"
        },
        rubies: ["2.3.0"],
        default_ruby: "2.3.0"
      },
      postgresql: {
        config: {
          listen_addresses: "localhost"
        },
        password: {
          postgres: ""
        }
      },
      # database: {
      #   create: ["myapp2_development"]
      # },
      # "run_list": ["recipe[postgresql::server]"]
    }
  end
end