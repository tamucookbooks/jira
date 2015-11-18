#
# Cookbook Name:: jira
# Recipe:: cas
#
# Copyright 2015, Texas A&M
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

template ::File.join(node['jira']['dir'], 'conf/web.xml') do
  action :create
  owner node['jira']['user']
  group node['jira']['group']
  mode 0644
  source 'config_files/web.xml.erb'
  notifies :restart, 'service[jira]', :delayed
end

template ::File.join(node['jira']['dir'], 'atlassian-jira/WEB-INF/classes/seraph-config.xml') do
  action :create
  owner node['jira']['user']
  group node['jira']['group']
  mode 0644
  source 'config_files/seraph-config.xml.erb'
  notifies :restart, 'service[jira]', :delayed
end

cas_core_pkg = "cas-client-core-#{node['jira']['plugin']['cas']['version']}.jar"

remote_file ::File.join(node['jira']['dir'], 'atlassian-jira/WEB-INF/lib/#{cas_core_pkg}') do
  action :create_if_missing
  source "#{node['jira']['plugin']['cas']['cas-client-core']['base_url']}/#{node['jira']['plugin']['cas']['version']}/#{cas_core_pkg}"
  owner node['jira']['user']
  group node['jira']['group']
  notifies :restart, 'service[jira]', :delayed
end

cas_atlassian_pkg = "cas-client-integration-atlassian-#{node['jira']['plugin']['cas']['version']}.jar"

remote_file ::File.join(node['jira']['dir'], 'atlassian-jira/WEB-INF/lib/#{cas_atlassian_pkg}') do
  action :create_if_missing
  source "#{node['jira']['plugin']['cas']['cas-client-atlassian']['base_url']}/#{node['jira']['plugin']['cas']['version']}/#{cas_atlassian_pkg}"
  owner node['jira']['user']
  group node['jira']['group']
  notifies :restart, 'service[jira]', :delayed
end
