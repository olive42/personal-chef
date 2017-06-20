# Policyfile.rb - Describe how you want Chef to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile.html

# A name that describes what the system you're building with Chef does.
name 'personalchef'

# Where to find external cookbooks:
default_source :supermarket

# run_list: chef-client will run these recipes in the order specified.
run_list 'machine-setup::default', 'caddy::default', 'user-files::default'

# Specify a custom source for a single cookbook:
# cookbook "example_cookbook", path: "../cookbooks/example_cookbook"
cookbook 'machine-setup', path: 'cookbooks/machine-setup'
cookbook 'user-files', path: 'cookbooks/user-files'

cookbook 'caddy'
