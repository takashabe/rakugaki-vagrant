#
# Cookbook Name:: oh-my-zsh
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "zsh" do
  action :install
end

git "home/rakugaki/.oh-my-zsh" do
  repository "git://github.com/robbyrussell/oh-my-zsh.git"
  reference  "master"
  action     "checkout"
  user       "rakugaki"
  group      "rakugaki"
end

template "/home/rakugaki/.zshrc" do
  owner "rakugaki"
  group "rakugaki"
  mode  "0755"
end

user "rakugaki" do
  shell  "/bin/zsh"
  action "modify"
end
