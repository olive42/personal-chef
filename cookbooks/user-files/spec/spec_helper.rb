require 'chefspec'
require 'chefspec/berkshelf'
require 'chef-vault/test_fixtures'

set :backend, :exec

ChefSpec::Coverage.start!
