vault = data_bag_item('secrets', 'network', ::IO.read(node['machine_setup']['secret_file']))

template '/etc/dhcp/dhclient6.conf' do
  group 'root'
  owner 'root'
  mode '0444'
  source 'dhclient6.conf.erb'
  variables(
    interface: node['machine']['default_interface'],
    duid: vault['duid']
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

service 'dhclient6' do
  # action [ :enable, :start ]
  action [:enable]
end
