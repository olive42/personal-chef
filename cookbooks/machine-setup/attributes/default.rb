# Keep it sorted
default['package_list'] = %w[fail2ban git ipcalc irssi pass tcptraceroute tmux
                             traceroute whois zsh]

# This should be overridable in kitchen test
default['machine']['default_interface'] = 'enp0s20'
