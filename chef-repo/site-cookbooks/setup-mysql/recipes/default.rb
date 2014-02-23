#
# Cookbook Name:: setup-mysql
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'yum-remi'

### setup mysql service
%w(mysql-server mysql).each do |pkg|
  package pkg do
    action :install
  end
end

service "mysqld" do
  supports :status=>true, :restart=>true, :reload=>true
  action [:enable, :restart]
end

### setup database
# setup connection
root_conn = "mysql -u root --password=\"#{node['setup-mysql']['params']['root_pass']}\""
app_conn  = "mysql -u #{node['setup-mysql']['params']['app_user']} --password=\"#{node['setup-mysql']['params']['app_pass']}\""

# create user
# execute create from template resource
execute "mysql-create-user" do
  only_if "which mysql"
  command "#{root_conn} < /tmp/grants.sql"
  action :nothing
end

template "/tmp/grants.sql" do
  owner "root"
  group "root"
  mode "0600"
  variables(
    :user     => node['setup-mysql']['params']['app_user'],
    :password => node['setup-mysql']['params']['app_pass'],
    :database => node['setup-mysql']['params']['database']
  )
  notifies :run, "execute[mysql-create-user]", :immediately
end

# create database
# todo なるべくGemとか使わない方針で
execute "mysql-create-database" do
  command "/usr/bin/mysqladmin -u root create #{node['example']['db']['database']}"
  not_if do
    require 'rubygems'
    Gem.clear_paths
    require 'mysql'
    m = Mysql.new(node['example']['db']['host'], "root", node['example']['db']['rootpass'])
    m.list_dbs.include?(node['example']['db']['database'])
  end
end
