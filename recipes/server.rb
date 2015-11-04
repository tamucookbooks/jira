#
# Cookbook Name:: jira
# Recipe:: server
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

jira_pkg = "atlassian-jira-#{node['jira']['version']}.tar.gz"

directory node['jira']['dir'] do
  action :create
  owner node['jira']['user']
  group node['jira']['group']
  mode 0754
end

ark 'jira' do
  url "#{node['jira']['base_url']}/#{jira_pkg}"
  action :put
  path '/opt/'
  only_if { node['jira']['installed_version'] != node['jira']['version'] }
  owner node['jira']['user']
  group node['jira']['group']
  notifies :create, 'ruby_block[set_installed_version]', :immediately
end

ruby_block 'set_installed_version' do
  block do
    node.set['jira']['installed_version'] = node['jira']['version']
    node.save
  end
  action :nothing
  not_if { Chef::Config[:solo] }
end

directory node['jira']['home_dir'] do
  action :create
  owner node['jira']['user']
  group node['jira']['group']
  mode 0754
end

template ::File.join(node['jira']['dir'], 'atlassian-jira/WEB-INF/classes/jira-application.properties') do
  action :create
  owner node['jira']['user']
  group node['jira']['group']
  mode 0644
  source 'application_files/jira-application.properties.erb'
  notifies :restart, 'service[jira]', :delayed
end

template ::File.join(node['jira']['dir'], 'conf/server.xml') do
  action :create
  owner node['jira']['user']
  group node['jira']['group']
  mode 0644
  source 'config_files/server.xml.erb'
  notifies :restart, 'service[jira]', :delayed
end

if node['jira']['plugin']['cas]'['enable'] do
  include_recipe "jira::cas"
end

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
