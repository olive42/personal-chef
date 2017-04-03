#
# Cookbook Name:: machine-setup
# Recipe:: default
#
# Copyright 2017, oliveth
#
# All rights reserved - Do Not Redistribute
#

# Install packages
package node['users']['package_list']

# Setup shells for users - make sure the packages are installed first!
node['users']['shells'].each do |u, s|
  user u do
    shell s
  end
end

include_recipe 'machine-setup::network'
