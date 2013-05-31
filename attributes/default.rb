default[:jira][:version] = "6.0.1"
default[:jira][:package] = "atlassian-jira-#{node[:jira][:version]}.tar.gz"

default[:jira][:download_url] = "http://downloads.atlassian.com/software/jira/downloads/#{node[:jira][:package]}"

default[:jira][:user] = "jira"
default[:jira][:group] = "jira"
default[:jira][:install_dir] = "/opt/jira"
default[:jira][:home_dir] = "/opt/jira_home"
