include_recipe "database"

case node[:jira][:database][:type]
when "postgresql"
  include_recipe "postgresql::server"
  include_recipe "postgresql::ruby"

  connection_info = { :host => node[:jira][:database][:host],
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
  #TODO: implement
end
