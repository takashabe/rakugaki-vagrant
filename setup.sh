#!/usr/bin/bash

# Setup use bundle library
bundle install --path vendor/install
cd chef-repo
bundle exec berks install --path cookbooks

# Setup vagrant
cd ..
vagrant up
vagrant ssh-config --host rakugaki >> ~/.ssh/config

# Setup chef-solo
cd chef-repo
bundle exec knife solo prepare rakugaki
bundle exec knife solo cook rakugaki
