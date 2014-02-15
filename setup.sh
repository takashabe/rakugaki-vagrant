#!/usr/bin/bash

bundle install --path vendor/install

cd chef-repo
bundle exec berks install --path cookbooks

cd ..
vagrant up
vagrant ssh-config --host rakugaki >> ~/.ssh/config

cd chef-repo
bundle exec knife solo cook rakugaki
