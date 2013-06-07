ark 'jira' do
  url node[:jira][:download_url]
  action :put
  path node[:jira][:dir]
  only_if { node[:jira][:installed_version] != node[:jira][:version] } 
  owner node[:jira][:user]
  group node[:jira][:group]
end

include_recipe "jira::configure_application"
include_recipe "jira::service"
