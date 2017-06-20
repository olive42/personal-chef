# How to setup

- Clone this repo.
- Run `bundle install` and/or
  - Install the ChefDK on your workstation.

## Chef / Knife zero (no Chef server)

- `chef export ./ -f`
- `knife zero bootstrap <remote-IP-or-hostname> --policyname personalchef
  --node-name <nodename> --user-name <username>`

## Hosted Chef

If using Hosted Chef, go to management console and get the knife.rb
configuration file which you put under .chef. You also need your
RSA private key. See
https://learn.chef.io/tutorials/manage-a-node/ubuntu/hosted/set-up-your-chef-server/
for more detail.

# Users data bags

- edit under data_bags/users/<username>.json
- knife data bag from file users <username>.json
