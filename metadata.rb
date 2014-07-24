name             'jira'
maintainer       'Texas A&M'
maintainer_email 'jarosser06@tamu.edu'
license          'MIT'
description      'Installs/Configures jira'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.0'
supports         'ubuntu', '>= 12.04'

%w{ ark postgresql mysql database }.each do |dep|
  depends dep
end
