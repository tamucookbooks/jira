Jira Cookbook
=============
This cookbook installs and configures jira.

Requirements
------------

#### cookbooks 

- `ark` - https://github.com/opscode-cookbooks/ark.git
- `postgresql` - https://github.com/opscode-cookbooks/postgresql
- `mysql` - https://github.com/chef-cookbooks/mysql

Attributes
----------

#### jira::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['jira']['version']</tt></td>
    <td>String</td>
    <td>version of jira to download and install</td>
    <td><tt>6.4.11</tt></td>
  </tr>
  <tr>
    <td><tt>['jira']['base_url']</tt></td>
    <td>String</td>
    <td>url to download jira from</td>
    <td><tt>http://downloads.atlassian.com/software/jira/downloads</tt></td>
  </tr>
  <tr>
    <td><tt>['jira']['user']</tt></td>
    <td>String</td>
    <td>user to start and run jira as</td>
    <td><tt>jira</tt></td>
  </tr>
  <tr>
    <td><tt>['jira']['group']</tt></td>
    <td>String</td>
    <td>group to start and run jira as</td>
    <td><tt>jira</tt></td>
  </tr>
  <tr>
    <td><tt>['jira']['dir']</tt></td>
    <td>String</td>
    <td>base directory to store the jira app and home dir in</td>
    <td><tt>/opt/jira</tt></td>
  </tr>
  <tr>
    <td><tt>['jira']['home_dir']</tt></td>
    <td>String</td>
    <td>the jira home directory path</td>
    <td><tt>/var/jira</tt></td>
  </tr>
  <tr>
    <td><tt>['jira']['app_properties']['jira_home']</tt></td>
    <td>String</td>
    <td>tells jira where to look for home directory</td>
    <td><tt>/usr/local/jira/home_dir</tt></td>
  </tr>
  <tr>
    <td><tt>['jira']['catalina']['connector']['port']</tt></td>
    <td>Integer</td>
    <td>catalina port</td>
    <td><tt>8080</tt></td>
  </tr>
  <tr>
    <td><tt>['jira']['catalina']['connector']['max_threads']</tt></td>
    <td>Integer</td>
    <td>catalina max threads</td>
    <td><tt>150</tt></td>
  </tr>
  <tr>
    <td><tt>['jira']['catalina']['connector']['min_spare_threads']</tt></td>
    <td>Integer</td>
    <td>catalina min spare threads</td>
    <td><tt>25</tt></td>
  </tr>
  <tr>
    <td><tt>['jira']['catalina']['connector']['connection_timeout']</tt></td>
    <td>Integer</td>
    <td>catalina connection timeout</td>
    <td><tt>20000</tt></td>
  </tr>
  <tr>
    <td><tt>['jira']['catalina']['connector']['enable_lookups']</tt></td>
    <td>String</td>
    <td>catalina enable lookups</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['jira']['catalina']['connector']['max_http_header_size']</tt></td>
    <td>Integer</td>
    <td>catalina max http header size</td>
    <td><tt>8192</tt></td>
  </tr>
  <tr>
    <td><tt>['jira']['catalina']['connector']['protocol']</tt></td>
    <td>String</td>
    <td>catalina protocol</td>
    <td><tt>HTTP/1.1</tt></td>
  </tr>
  <tr>
    <td><tt>['jira']['catalina']['connector']['use_body_encoding_for_uri']</tt></td>
    <td>String</td>
    <td>catalina body coding for URI</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['jira']['catalina']['connector']['redirect_port']</tt></td>
    <td>Integer</td>
    <td>catalina redirect port</td>
    <td><tt>8443</tt></td>
  </tr>
  <tr>
    <td><tt>['jira']['catalina']['connector']['accept_count']</tt></td>
    <td>Integer</td>
    <td>catalina accept count</td>
    <td><tt>100</tt></td>
  </tr>
  <tr>
    <td><tt>['jira']['catalina']['connector']['disable_upload_timeout']</tt></td>
    <td>String</td>
    <td>catalina disable upload timeout</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['jira']['catalina']['connector']['https_proxy']</tt></td>
    <td>Boolean</td>
    <td>catalina use https proxy</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['jira']['catalina']['connector']['scheme']</tt></td>
    <td>String</td>
    <td>catalina proxy scheme</td>
    <td><tt>https</tt></td>
  </tr>
  <tr>
    <td><tt>['jira']['catalina']['connector']['proxy_port']</tt></td>
    <td>Integer</td>
    <td>catalina proxy port</td>
    <td><tt>443</tt></td>
  </tr>
  <tr>
    <td><tt>['jira']['catalina']['connector']['proxy_name']</tt></td>
    <td>String</td>
    <td>catalina proxy name</td>
    <td><tt>node['fqdn']</tt></td>
  </tr>
</table>

#### jira::database
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['jira']['database']['type']</tt></td>
    <td>String</td>
    <td>the type of database to use</td>
    <td><tt>postgresql</tt></td>
  </tr>
  <tr>
    <td><tt>['jira']['database']['user']</tt></td>
    <td>String</td>
    <td>the user to connect to the db with</td>
    <td><tt>jira</tt></td>
  </tr>
  <tr>
    <td><tt>['jira']['database']['password']</tt></td>
    <td>String</td>
    <td>the password to connect to the db with</td>
    <td><tt>jira</tt></td>
  </tr>
  <tr>
    <td><tt>['jira']['database']['host']</tt></td>
    <td>String</td>
    <td>the database host</td>
    <td><tt>localhost</tt></td>
  </tr>
  <tr>
    <td><tt>['jira']['database']['name']</tt></td>
    <td>String</td>
    <td>the name of the database to use</td>
    <td><tt>jira</tt></td>
  </tr>
</table>

Usage
-----
#### jira::default

The default recipe includes the necessary recipes to install jira but does not include the database recipe by default.

This cookbook is meant to make configuring jira very easy just by using attributes.  For instance in order to set a new setting in jira-application.properties such as jira.title = My Jira you can include it as the following.  You should be able to use any and all variables supported by jira just use an underscore instead of a period as the attribute name.

```json
{
  "name":"my_node",
  "attributes": {
    "jira": {
      "app_properties": {
        "jira_title" = "My Jira"
      }
    }
  },
  "run_list": [
    "recipe[jira]"
  ]
}
```

If you are using a proxy in front of jira for ssl you can have jira set up for that by setting http_proxy to true and changing the proxy_name. ( by default the proxy name is the fqdn of the node jira is installed on)

```json
{
  "name":"my_node",
  "attributes": {
    "jira": {
      "catalina": {
        "connector": {
          "https_proxy": true,
          "proxy_name": "tickets.my_domain.com"
        }
      }
    }
  },
  "run_list": [
    "recipe[jira]"
  ]
}
```

#### jira::database

By default the database installed and used is postgresql.

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[jira::database]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: 

* Jim Rosser
* Victoria Blessing
