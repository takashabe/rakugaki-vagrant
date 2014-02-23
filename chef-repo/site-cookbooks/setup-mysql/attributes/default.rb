# database user parameter
default['setup-mysql']['params']['app_user'] = 'username'
default['setup-mysql']['params']['app_pass'] = 'password'
default['setup-mysql']['params']['database'] = 'rakugaki'
default['setup-mysql']['params']['host'] = 'localhost'
default['setup-mysql']['params']['root_pass'] = ''

# create table statement
default['setup-mysql']['create_table']['user'] =
  <<-EOS
    CREATE TABLE user (
    user_id VARCHAR(32) NOT NULL PRIMARY KEY,
    ENGINE=InnoDB character set utf8);
  EOS

default['setup-mysql']['create_table']['book'] =
  <<-EOS
    CREATE TABLE book (
    book_id VARCHAR(32) NOT NULL PRIMARY KEY,
    ENGINE=InnoDB character set utf8);
  EOS
