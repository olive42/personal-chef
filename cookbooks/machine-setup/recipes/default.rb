#
# Cookbook Name:: machine-setup
# Recipe:: default
#
# Copyright 2017, Olivier Tharan <olivier@tharan.org>
#
# All rights reserved - Do Not Redistribute
#

# Install packages
package node['package_list']

# Setup network
include_recipe 'machine-setup::network'

# Git repositories
group 'git' do
  system true
  # TODO: make this members of some attribute-driven 'admin' group
  members ['olive']
end

user 'git' do
  comment 'Git user'
  gid 'git'
  home '/var/opt/git'
  shell '/etc/noshell'
  system true
end

directory '/var/opt/git' do
  owner 'git'
  mode '0750'
end

# TODO: uncomment once IPv6 resolution is fixed.
# Nginx
# include_recipe 'nginx'
# nginx_site 'bouffe.tharan.org' do
#   template 'bouffe.tharan.org.conf.erb'
# end
