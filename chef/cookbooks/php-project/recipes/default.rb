include_recipe "apache2"
include_recipe "mysql::server"
include_recipe "mysql::client"
include_recipe "php"
include_recipe "php::module_mysql"
include_recipe "apache2::mod_php5"
include_recipe "mysql::ruby"

apache_site "default" do
  enable false
end

mysql_database node['php-project']['database'] do
  connection({ :host => 'localhost',
               :username => 'root',
               :password => node['mysql']['server_root_password'],
  })
  action :create
end

mysql_database_user node['php-project']['db_username'] do
  connection({ :host => 'localhost',
               :username => 'root',
               :password => node['mysql']['server_root_password']
  })

  password node['php-project']['db_password']
  database_name node['php-project']['database']
  privileges [ :select,
               :update,
               :insert,
               :create,
               :delete
  ]
  action :grant
end

web_app 'php-project' do
  template 'site.conf.erb'
  docroot node['php-project']['path']
  server_name node['php-project']['server_name']
end