#
# Cookbook Name:: machine-setup
# Recipe:: default
#
# Copyright 2017, oliveth
#
# All rights reserved - Do Not Redistribute
#

# Install packages
node['users']['package_list'].each do |p|
  package p
end

# Setup shells for users - make sure the packages are installed first!
node['users']['shells'].each do |u, s|
  user u do
    shell s
  end
end
