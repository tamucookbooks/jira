default[:jira][:version] = "6.1.4"
default[:jira][:package] = "atlassian-jira-#{node[:jira][:version]}.tar.gz"

default[:jira][:download_url] = "http://downloads.atlassian.com/software/jira/downloads/#{node[:jira][:package]}"
default[:jira][:user] = "jira"
default[:jira][:group] = "jira"

# base dir to store jira
default[:jira][:dir] = '/opt/jira'
# home directory stores configs, and things specific to instance
default[:jira][:home_dir] = '/usr/local/jira'
