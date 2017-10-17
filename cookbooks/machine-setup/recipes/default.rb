#
# Cookbook Name:: machine-setup
# Recipe:: default
#
# Copyright 2017, oliveth
#
# All rights reserved - Do Not Redistribute
#

# Install packages
package node['package_list']

include_recipe 'machine-setup::network'
include_recipe 'nginx'
nginx_site 'bouffe.tharan.org' do
  template 'bouffe.tharan.org.conf.erb'
end