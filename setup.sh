#!/usr/bin/bash

bundle install --path vendor/install
cd chef-repo
bundle exec berks install --path cookbooks
