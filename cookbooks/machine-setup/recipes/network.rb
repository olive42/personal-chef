include_recipe 'chef-vault'
vault = chef_vault_item(:credentials, 'serversecret')

template '/etc/dhcp/dhclient6.conf' do
  group 'root'
  owner 'root'
  mode '0444'
  checksum '944d3bb1f9d55e33f02ddec9656f56552fd912ea31cc92cce29d4d666b5dec68'
  source 'dhclient6.conf.erb'
  variables(
    interface: node['machine']['default_interface']
    duid: vault['duid']
  )
end

template '/etc/systemd/system/dhclient6.service' do
  group 'root'
  owner 'root'
  mode '0444'
  checksum '06b32746b9fef74af9f63cce190dd840495ec8fba33eca2288d976623b542de6'
  source 'dhclient6.service.erb'
  variables(
    interface: node['machine']['default_interface']
  )
  notifies :run, 'execute[systemctl-daemon-reload]', :immediately
end

execute 'systemctl-daemon-reload' do
  command '/sbin/systemctl --system daemon-reload'
  action :nothing
end

# service 'dhclient6' do
#   action [ :enable, :start ]
# end
