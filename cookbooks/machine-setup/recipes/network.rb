cookbook_file '/etc/dhcp/dhclient6.conf' do
  group 'root'
  owner 'root'
  mode '0444'
  checksum '24ec7a28e5651b462514f5ce31228d2503820356e2d5f40e68683fc42faf76fd'
  source 'dhclient6.conf'
end
