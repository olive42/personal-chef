require 'chefspec'
require 'chefspec/policyfile'

set :backend, :exec

ChefSpec::Coverage.start!
