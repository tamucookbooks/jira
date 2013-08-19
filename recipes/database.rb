include_recipe "database"

case node[:jira][:database][:type]
when "postgresql"
  include_recipe "postgresql::server"
  include_recipe "postgresql::ruby"

  connection_info = { :host => "localhost",
                      :port => node[:postgresql][:config][:port],
                      :username => "postgres",
                      :password => node[:postgresql][:password][:postgres]
                    }

  postgresql_database node[:jira][:database][:name] do
    template 'template0'
    encoding 'UNICODE'
    collation 'en_US.utf8'
    connection connection_info
  end

  postgresql_database_user node[:jira][:database][:user] do
    database_name node[:jira][:database][:name]
    password node[:jira][:database][:password]
    privileges [:all]
    action [:create, :grant]
    connection connection_info
  end

when "mysql"
  include_recipe "mysql::server"
  include_recipe "mysql::ruby"

  connection_info = { :host => "localhost",
                      :port => node[:mysql][:port],
                      :username => "root",
                      :password => node[:mysql][:server_root_password]
                    }

  mysql_database node[:jira][:database][:name] do
    connection connection_info
    action :create
  end

  mysql_database_user node[:jira][:database][:user] do
    action :create
    password node[:jira][:database][:password]
    database_name node[:jira][:database][:name]
    connection connection_info
  end
else
  Chef::Log.warning("Only MySQL and Postgresql are supported by this recipe")
end
