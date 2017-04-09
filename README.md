# Chef environment

If using Hosted Chef, go to management console and get the knife.rb
configuration file which you put under .chef. You also need your
RSA private key. See
https://learn.chef.io/tutorials/manage-a-node/ubuntu/hosted/set-up-your-chef-server/
for more detail.

# How to setup

- Clone this repo
- Install the ChefDK on your workstation
- `knife bootstrap <remote-IP> --sudo -N <nodename> -x <username>`

# Users data bags

- edit under data_bags/users/<username>.json
- knife data bag from file users <username>.json
