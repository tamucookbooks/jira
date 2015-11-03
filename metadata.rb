name             'jira'
maintainer       'Texas A&M'
maintainer_email 'jarosser06@tamu.edu'
license          'MIT'
description      'Installs/Configures jira'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.0'
supports         'ubuntu', '>= 14.04'

%w{ ark postgresql mysql }.each do |dep|
  depends dep
end
