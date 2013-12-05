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
