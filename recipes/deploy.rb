directory node['jira']['dir'] do
  action :create
  owner node['jira']['user']
  group node['jira']['group']
  mode 0754
end

ark 'jira' do
  url node['jira']['download_url']
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

include_recipe 'jira::configure_application'
include_recipe 'jira::configure_server'
include_recipe 'jira::service'
