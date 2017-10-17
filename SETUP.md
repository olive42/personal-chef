# How to setup

- Clone this repo.
- Run `bundle install` and/or
  - Install the ChefDK on your workstation.

## Chef solo

All necessary files, including dependent cookbooks, are pushed to the node and
chef-solo is run from there.

Usage:

```
bundle update
for i in cookbooks/{machine-setup,user-files} ; do
    pushd $i
    bundle exec berks update
    bundle exec berks vendor ../
done

./deploy.sh
```

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

`bundle exec knife data bag edit users <username>`
`bundle exec knife data bag edit secrets network` # requires secret key
- edit under data_bags/users/<username>.json
- knife data bag from file users <username>.json
