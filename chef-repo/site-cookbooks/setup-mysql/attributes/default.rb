# database user parameter
default['setup-mysql']['params']['app_user'] = 'rakugaki'
default['setup-mysql']['params']['app_pass'] = 'password'
default['setup-mysql']['params']['database'] = 'rakugaki'
default['setup-mysql']['params']['host'] = 'localhost'
default['setup-mysql']['params']['root_pass'] = ''

# create database statement
default['setup-mysql']['create-database']['rakugaki'] = <<-EOS
  CREATE DATABASE IF NOT EXISTS rakugaki CHARACTER SET utf8 COLLATE utf8_general_ci;
EOS

# create table statement
default['setup-mysql']['create-table']['user'] = <<-EOS
  CREATE TABLE IF NOT EXISTS user (
  user_id VARCHAR(32) NOT NULL,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL,
  PRIMARY KEY (user_id)
  ) ENGINE=InnoDB character set utf8;
EOS

default['setup-mysql']['create-table']['book'] = <<-EOS
  CREATE TABLE IF NOT EXISTS book (
  book_id VARCHAR(32) NOT NULL,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL,
  PRIMARY KEY (book_id)
  ) ENGINE=InnoDB character set utf8;
EOS
