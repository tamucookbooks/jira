template ::File.join(node['jira']['dir'], 'conf/server.xml') do
  action :create
  owner node['jira']['user']
  group node['jira']['group']
  mode 0644
  source 'config_files/server.xml.erb'
  notifies :restart, 'service[jira]', :delayed
end
