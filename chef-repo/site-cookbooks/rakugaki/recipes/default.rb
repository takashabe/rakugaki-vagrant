#
# Cookbook Name:: rakugaki
# Recipe:: default
#
# Copyright 2014, @takashabe
#
# All rights reserved - Do Not Redistribute
#

# Initialize app user
user 'rakugaki' do
  supports  :manage_home => true
  comment   'app user'
  uid       550
  password  'rakugaki'
  shell     '/bin/bash'
  action    [:create, :manage]
end

group 'rakugaki' do
  group_name 'rakugaki'
  gid        550
  members    ['rakugaki']
  action     [:create]
end

group 'vagrant' do
  group_name 'vagrant'
  members    ['rakugaki']
  action     [:modify]
end

# make symbolic link from app
link '/home/rakugaki/rakugaki' do
  to     '/opt/rakugaki'
  action :create
end
