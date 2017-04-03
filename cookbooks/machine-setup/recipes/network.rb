cookbook_file '/etc/dhcp/dhclient6.conf' do
  group 'root'
  owner 'root'
  mode '0444'
  checksum '944d3bb1f9d55e33f02ddec9656f56552fd912ea31cc92cce29d4d666b5dec68'
  source 'dhclient6.conf'
end
