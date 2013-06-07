ark 'jira' do
  url node[:jira][:download_url]
  action :put
  path node[:jira][:dir]
  only_if { node[:jira][:installed_version] != node[:jira][:version] } 
  owner node[:jira][:user]
  group node[:jira][:group]
end

directory node[:jira][:home_dir] do
  action :create
  owner node[:jira][:user]
  group node[:jira][:group]
  mode "0754"
end

include_recipe "jira::configure_application"
include_recipe "jira::service"
