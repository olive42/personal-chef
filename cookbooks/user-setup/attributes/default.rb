# FIXME: maybe set this to 'user-setup'?
# username -> shell

# TODO: find a better way to manage users
node['users']['shells'] = [
  'olive' => '/usr/bin/zsh',
],

# Keep it sorted
node['users']['package_list'] = [
  'irssi',
  'tcptraceroute',
  'tmux',
  'traceroute-nanog',
  'whois',
  'zsh',
]
