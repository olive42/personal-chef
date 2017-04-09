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

directory '/home' do
  owner 'root'
  group 'root'
  mode '0755'
end

# TODO: add support for gid != uid
# TODO: add support for MacOS vs Linux
search(:users) do |u|
  home_dir = "/home/#{u['id']}"

  user "#{u['id']}" do
    home "#{home_dir}"
  end

  if u.key?('directories')
    u['directories'].each do |dir|
      directory "#{home_dir}/#{dir}" do
        recursive true
        mode '0755'
        user u['id']
        group u['id']
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
        end
      end

      cookbook_file "#{home_dir}/#{filename}" do
        source "#{u['id']}/#{file_data['source']}"
        owner u['id']
        group u['id']
        mode '0444'
      end
    end
  end
end
