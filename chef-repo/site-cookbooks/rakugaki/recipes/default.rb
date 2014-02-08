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
  comment   'rakugaki user'
  uid       599
  password  'rakugaki'
  supports  :manage_home => true
  action    [:create, :manage]
end
