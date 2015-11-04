default['jira']['version'] = '6.4.11'
default['jira']['base_url'] = 'http://downloads.atlassian.com/software/jira/downloads'
default['jira']['user'] = 'jira'
default['jira']['group'] = 'jira'

# base dir to store jira
default['jira']['dir'] = '/opt/jira'
# home directory stores configs, and things specific to instance
default['jira']['home_dir'] = '/var/jira'

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

# To enable CAS plugin and use CAS for login: set enable to true 
# and update cas_server_url_prefix and server_name
default['jira']['plugin']['cas']['enable'] = false
default['jira']['plugin']['cas']['cas_server_url_prefix'] = 'https://cas.domain.edu/cas'
default['jira']['plugin']['cas']['server_name'] = 'https://jira.domain.edu'
default['jira']['plugin']['cas']['version'] = '3.4.1'
default['jira']['plugin']['cas']['cas-client-core']['base_url'] = 'http://repo2.maven.org/maven2/org/jasig/cas/client/cas-client-core/'
default['jira']['plugin']['cas']['cas-client-atlassian']['base_url'] = 'http://repo2.maven.org/maven2/org/jasig/cas/client/cas-client-integration-atlassian/'
