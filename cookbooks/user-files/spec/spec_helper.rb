require 'chefspec'
require 'chefspec/berkshelf'

set :backend, :exec

ChefSpec::Coverage.start!
