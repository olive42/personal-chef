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
