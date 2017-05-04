require 'spec_helper'

describe 'machine-setup::default' do
  it 'installed the git package' do
    expect(package('git')).to be_installed
  end
end
