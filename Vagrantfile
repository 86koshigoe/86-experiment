# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "chef/centos-6.6"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network "forwarded_port", guest: 80, host: 80
  config.vm.network "forwarded_port", guest: 443, host: 443

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "./", "/var/www/86-experiment", create: true,
                          # owner: "vagrant",
                          # group: "www-data",
                          mount_options: ["dmode=777,fmode=666"]

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
    # Customize the amount of memory on the VM:
    vb.memory = "2048"
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline <<-SHELL
  #   sudo apt-get install apache2
  # SHELL

  # config.omnibus.chef_version = :latest
  config.vm.provision "chef_zero" do |chef|
    # Specify the local paths where Chef data is stored
    chef.cookbooks_path = ["cookbooks", "./site-cookbooks"]
    # chef.roles_path = "roles"
    # chef.nodes_path = "nodes"

    # Add a recipe
    chef.add_recipe "yum-remi"
    chef.add_recipe "system"
    chef.add_recipe "selinux::disabled"
    chef.add_recipe "git"
    chef.add_recipe "mysql::server"
    chef.add_recipe "mysql::client"
    chef.add_recipe "php"
    chef.add_recipe "php-fpm"
    chef.add_recipe "nginx"
    chef.add_recipe "application"

    # # Or maybe a role
    # chef.add_role "web"

    chef.json = {
      "remi" => {
        "php55" => {
          "enabled" => true
        }
      },
      "system" => {
        "timezone" => "Asia/Tokyo"
      },
      "php-fpm" => {
        "skip_repository_install" => true,
        "user" => "nginx",
        "group" => "nginx",
      },
      "php" => {
        "packages" => %w(php php-devel php-cli php-pear php-mcrypt php-pdo php-mysql),
      #   "install_method" => "source",
      #   "version" => "5.5.20",
      #   "checksum" => "7454e4f2dba3b08b2c88bb178e7bf704ed100f3d7ab6b83ea5046a6e4acb7295",
      },
      "mysql" => {
        "server_root_password" => "",
        "enable_utf8" => "true",
      },
    }
  end
end
