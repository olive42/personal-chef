name 'personal-chef'
run_list 'machine-setup', 'user-files'
default_source :supermarket

cookbook 'chef-vault'
cookbook 'machine-setup', path: "cookbooks/machine-setup"
cookbook 'user-files', path: "cookbooks/user-files"
