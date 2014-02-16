#
# Cookbook Name:: rakugaki
# Recipe:: default
#
# Copyright 2014, @takashabe
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'yum-remi'

# Initialize app user
user 'rakugaki' do
  supports  :manage_home => true
  comment   'rakugaki user'
  uid       599
  password  'rakugaki'
  shell     "/bin/bash"
  action    [:create, :manage]
end

# make symbolic link from app
link "/home/rakugaki/rakugaki" do
  to     "/opt/rakugaki"
  action :create
end

# Upgrade MySQL
package "mysql-server" do
  action :upgrade
end
