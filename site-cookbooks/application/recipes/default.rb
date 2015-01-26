#
# Cookbook Name:: application
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

file "/tmp/something" do
  action :create_if_missing
end
