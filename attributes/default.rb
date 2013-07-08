default[:jira][:version] = "6.0.3"
default[:jira][:package] = "atlassian-jira-#{node[:jira][:version]}.tar.gz"

default[:jira][:download_url] = "http://downloads.atlassian.com/software/jira/downloads/#{node[:jira][:package]}"
default[:jira][:user] = "jira"
default[:jira][:group] = "jira"

# base dir to store jira 
default[:jira][:dir] = "/usr/local/jira"
# home directory stores configs, and things specific to instance
default[:jira][:home_dir] = "#{node[:jira][:dir]}/jira_home"
# directory jira is extracted to
default[:jira][:app_dir] = "#{node[:jira][:dir]}/jira"
