#
# Cookbook Name:: setup-mysql
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'yum-remi'

# setup mysql service
%w(mysql-server mysql-devel mysql).each do |pkg|
  package pkg do
    action :install
  end
end

service "mysqld" do
  supports :status=>true, :restart=>true, :reload=>true
  action [:enable, :restart]
end

# setup database
