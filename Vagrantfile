# -*- mode: ruby -*-
# vi: set ft=ruby :

project_path = '/opt/project'

Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.network :private_network, ip: "192.168.90.131"
  config.vm.synced_folder ".", project_path, :owner => "www-data", :group => "www-data"

  config.vm.provider :virtualbox do |vb|
    # Helps with slowness
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--memory", 1024]
  end

  # Chef FTW
  config.vm.provision :chef_solo do |chef|

    #chef.log_level = :debug

    chef.cookbooks_path = "chef/cookbooks"
    chef.data_bags_path = "chef/data_bags"

    chef.add_recipe "apt"
    chef.add_recipe "php-project"

    chef.json.merge!({
      "mysql" => {
        "server_root_password" => "123456",
        "server_debian_password" => "123456",
        "server_repl_password" => "123456",
        "bind_address" => "0.0.0.0",
      },

      "php-project" => {
        "database" => "project",
        "db_username" => "project",
        "db_password" => "123456",
        "path" => project_path + '/public',
        "server_name" => "wyatt.dev",
      }
    })
  end
end
