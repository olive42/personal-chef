#!/bin/bash

# This runs as root on the server

chef_binary=/var/lib/gems/2.3.0/gems/chef-13.5.3/bin/chef-solo

# Are we on a vanilla system?
if ! test -f "$chef_binary"; then
    export DEBIAN_FRONTEND=noninteractive
    apt update &&
        apt install -y ruby2.3 ruby2.3-dev make &&
        sudo gem2.3 install --no-rdoc --no-ri chef --version 13.5.3
fi &&

"$chef_binary" -c solo.rb -j solo.json
