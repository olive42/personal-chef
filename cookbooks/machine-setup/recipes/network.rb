include_recipe 'chef-vault'
vault = chef_vault_item(:credentials, 'serversecret')

template '/etc/dhcp/dhclient6.conf' do
  group 'root'
  owner 'root'
  mode '0444'
  source 'dhclient6.conf.erb'
  variables(
    interface: node['machine']['default_interface'],
    # duid: vault[node.name]['duid']
    duid: vault['default-ubuntu-1610.vagrantup.com']['duid']
  )
end

template '/etc/systemd/system/dhclient6.service' do
  group 'root'
  owner 'root'
  mode '0444'
  source 'dhclient6.service.erb'
  variables(
    interface: node['machine']['default_interface']
  )
  notifies :run, 'execute[systemctl-daemon-reload]', :immediately
end

execute 'systemctl-daemon-reload' do
  command '/bin/systemctl --system daemon-reload'
  action :nothing
end

# service 'dhclient6' do
#   action [ :enable, :start ]
# end
