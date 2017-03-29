#
# Cookbook Name:: user-setup
# Recipe:: default
#
# Copyright 2017, oliveth
#
# All rights reserved - Do Not Redistribute
#

# Install shells
node['users']['shells'].each do |user, shell|
  user user do
    shell shell
  end
end

# Install packages
node['users']['package_list'].each do |p|
  package p
end
