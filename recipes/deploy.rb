Chef::Log.info("DEBUG!!!!!!!!!!!!!!!!! url = #{node[:jira][:download_url]}")
ark 'jira' do
  url node[:jira][:download_url]
  action :put
  path node[:jira][:home_dir]
  only_if { node[:jira][:installed_version] != node[:jira][:version] } 
end
