template "#{node[:jira][:dir]}/jira/atlassian-jira/WEB-INF/classes/jira-application.properties" do
  action :create
  owner node[:jira][:user]
  group node[:jira][:group]
  mode "0644"
  source "application_files/jira-application.properties.erb"
  notifies :restart, "service[jira]", :delayed
end
