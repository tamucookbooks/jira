default['jira']['version'] = '6.1.4'
default['jira']['package'] = "atlassian-jira-#{node['jira']['version']}.tar.gz"

default['jira']['download_url'] = "http://downloads.atlassian.com/software/jira/downloads/#{node[:jira][:package]}"
default['jira']['user'] = 'jira'
default['jira']['group'] = 'jira'

# base dir to store jira
default['jira']['dir'] = '/opt/jira'
# home directory stores configs, and things specific to instance
default['jira']['home_dir'] = '/usr/local/jira'

default['jira']['app_properties']['jira_home'] = node['jira']['home_dir']

default['jira']['catalina']['connector']['port'] = 8080
default['jira']['catalina']['connector']['max_threads'] = 150
default['jira']['catalina']['connector']['min_spare_threads'] = 25
default['jira']['catalina']['connector']['connection_timeout'] = 20000
default['jira']['catalina']['connector']['enable_lookups'] = 'false'
default['jira']['catalina']['connector']['max_http_header_size'] = 8192
default['jira']['catalina']['connector']['protocol'] = 'HTTP/1.1'
default['jira']['catalina']['connector']['use_body_encoding_for_uri'] = 'true'
default['jira']['catalina']['connector']['redirect_port'] = 8443
default['jira']['catalina']['connector']['accept_count'] = 100
default['jira']['catalina']['connector']['disable_upload_timeout'] = 'true'

# To enable ssl forwarding from a loadbalancer set https_proxy to
# true and update the proxy_name.
default['jira']['catalina']['connector']['https_proxy'] = false
default['jira']['catalina']['connector']['scheme'] = 'https'
default['jira']['catalina']['connector']['proxy_port'] = 443
default['jira']['catalina']['connector']['proxy_name'] = node['fqdn']
