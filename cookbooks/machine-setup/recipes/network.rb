cookbook_file '/etc/dhcp/dhclient6.conf' do
  group 'root'
  owner 'root'
  mode '0444'
  checksum '6b307b0fcce1008cc9d4d2af2d68aa313c8fee548bad2bb00da675a0226e2abe'
  source 'dhclient6.conf'
end
