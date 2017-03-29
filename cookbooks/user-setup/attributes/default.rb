# FIXME: maybe set this to 'user-setup'?
# username -> shell

# TODO: find a better way to manage users
default['users']['shells'] = {
  'olive' => '/usr/bin/zsh',
},

# Keep it sorted
default['users']['package_list'] = [
  'git',
  'irssi',
  'pass',
 'tcptraceroute',
  'tmux',
  'traceroute-nanog',
  'whois',
  'zsh',
]
