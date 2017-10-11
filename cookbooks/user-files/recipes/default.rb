#
# Cookbook:: user-files
# Recipe:: default
#
# The MIT License (MIT)
#
# Copyright:: 2017, The Authors
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

vault = data_bag_item('secrets', 'userpass', ::IO.read(node['user_files']['secret_file']))

directory '/home' do
  owner 'root'
  group 'root'
  mode '0755'
end

# TODO: add support for gid != uid
# TODO: add support for MacOS vs Linux
search(:users) do |u|
  user = u['id']
  home_dir = "/home/#{user}"
  group = (u.key?('group') ? u['group'] : user)

  shell = (u.key?('shell') ? u['shell'] : '/bin/bash')
  user user do
    home home_dir
    shell shell
  end

  if u.key?('directories')
    u['directories'].each do |dir|
      directory "#{home_dir}/#{dir}" do
        recursive true
        mode '0755'
        owner user
        group group
        :create
      end
    end
  end

  if u.key?('files')
    u['files'].each do |filename, file_data|
      if file_data.key?('sub_dir')
        directory "#{home_dir}/#{::File.dirname(filename)}" do
          recursive true
          mode '0755'
          owner user
          group group
        end
      end

      cookbook_file "#{home_dir}/#{filename}" do
        source "#{user}/#{file_data['source']}"
        owner user
        group group
        mode '0444'
      end
    end
  end

  if u.key?('irc')
    template "#{home_dir}/.irssi/config" do
      source "#{user}/dot-irssi-config.erb"
      owner user
      group group
      mode '0644'
      variables(
        servers: u['irc']['servers'],
        # FIXME: this is another level of indirection, as <% @pass %>
        # is defined inside the data bag and not expanded :/
        pass: vault[user]['irc']
      )
    end
  end

  if u.key?('authorized_keys')
    template "#{home_dir}/.ssh/authorized_keys" do
      source "#{user}/authorized_keys.erb"
      owner user
      group group
      mode '0600'
      variables(
        sshkeys: u['authorized_keys']
      )
    end
  end
end
