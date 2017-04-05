cookbook_file '/etc/dhcp/dhclient6.conf' do
  group 'root'
  owner 'root'
  mode '0444'
  checksum '944d3bb1f9d55e33f02ddec9656f56552fd912ea31cc92cce29d4d666b5dec68'
  source 'dhclient6.conf'
end

cookbook_file '/etc/systemd/system/dhclient6.service' do
  group 'root'
  owner 'root'
  mode '0444'
  checksum '06b32746b9fef74af9f63cce190dd840495ec8fba33eca2288d976623b542de6'
  source 'dhclient6.service'
end

# service 'dhclient6' do
#   action [ :enable, :start ]
# end
