# Cookbook:: linux_web_server
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.
# install the unzip package
package 'unzip' do
  action :install
end

if platform_family?('debian','ubuntu')
  apt_update
end

package 'Install Apache' do
  case node['platform']
  when 'redhat', 'centos'
    package_name 'httpd'
    action:upgrade
  when 'ubuntu', 'debian'
    package_name 'apache2'
    action:upgrade
  end
end

cookbook_file '/var/www/testsite.zip' do
  source 'testsite.zip'
  mode '0755'
  owner 'root'
end

bash 'extract files' do
  cwd '/var/www'
  code <<-EOH
  sudo unzip -o testsite.zip
  EOH
end

service 'Start Apache' do
  case node['platform']
  when 'redhat', 'centos'
    service_name 'httpd'
    action [:enable, :start]
  when 'ubuntu', 'debian'
    service_name 'apache2'
    action [:enable, :start]
  end
end