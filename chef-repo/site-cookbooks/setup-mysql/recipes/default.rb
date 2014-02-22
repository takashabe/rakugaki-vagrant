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
# Initialize user password
app_user_name = node["mysql"]["app_user"]["name"]
app_user_pass = node["mysql"]["app_user"]["pass"]
root_user_pass = node["mysql"]["root"]["pass"]

# Set connection
root_conn = "mysql -uroot"
app_conn  = "mysql -u#{app_user_name} -p#{app_user_pass}"

script "create_mysql_user" do
  interpreter "bash"
  not_if "#{app_conn}"
  code <<-EOL
  #{root_conn} << EOF
  grant all privileges on *.* to #{app_user_name}@'localhost' identified by "#{app_user_pass}";
  drop database test;
  flush privileges;
EOF
  EOL
end

node["mysql"]["app_tables"].each do |table|
  create_statement = table["create"] << default["setup-mysql"]["create_suffix"]
  p create_statement
  # script "create_app_table" do
    # interpreter "bash"
    # not_if "#{app_conn} -e 'desc #{create_mysql_user}'"
    # code <<-EOL
    # #{app_conn} << EOF
    # #{table["create"]}
# EOF
    # EOL
  # end
end
