#
# Cookbook Name:: application
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template "/etc/nginx/default.d/php-fpm.conf" do
  source "nginx.conf.erb"
  mode 00644
  owner "root"
  group  node['root_group']
  notifies :reload, "service[nginx]"
end
