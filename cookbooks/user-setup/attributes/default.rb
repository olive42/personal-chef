# FIXME: maybe set the top-level attribute name to 'user-setup'?

# TODO: find a better way to manage users
# Do not forget to add the related package in package_list if the
# shell is not present yet
default['users']['shells'] = {
  'olive' => '/usr/bin/zsh'
}

# Keep it sorted
default['users']['package_list'] = [
  'git',
  'irssi',
  'pass',
  'tcptraceroute',
  'tmux',
  'traceroute',
  'whois',
  'zsh'
]
