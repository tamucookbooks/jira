jira_pkg = "atlassian-jira-#{node['jira']['version']}.tar.gz"

directory node['jira']['dir'] do
  action :create
  owner node['jira']['user']
  group node['jira']['group']
  mode 0754
end

ark 'jira' do
  url "#{node['jira']['base_url']}/#{jira_pkg}"
  action :put
  path '/opt/'
  only_if { node['jira']['installed_version'] != node['jira']['version'] }
  owner node['jira']['user']
  group node['jira']['group']
  notifies :create, 'ruby_block[set_installed_version]', :immediately
end

ruby_block 'set_installed_version' do
  block do
    node.set['jira']['installed_version'] = node['jira']['version']
    node.save
  end
  action :nothing
  not_if { Chef::Config[:solo] }
end

directory node['jira']['home_dir'] do
  action :create
  owner node['jira']['user']
  group node['jira']['group']
  mode 0754
end

template ::File.join(node['jira']['dir'], 'atlassian-jira/WEB-INF/classes/jira-application.properties') do
  action :create
  owner node['jira']['user']
  group node['jira']['group']
  mode 0644
  source 'application_files/jira-application.properties.erb'
  notifies :restart, 'service[jira]', :delayed
end

template ::File.join(node['jira']['dir'], 'conf/server.xml') do
  action :create
  owner node['jira']['user']
  group node['jira']['group']
  mode 0644
  source 'config_files/server.xml.erb'
  notifies :restart, 'service[jira]', :delayed
end

template '/etc/init.d/jira' do
  action :create
  source 'init/jira.erb'
  mode 0755
  notifies :restart, 'service[jira]', :delayed
end

service 'jira' do
  supports :start => true, :restart => true
  action [:enable, :start]
end
