#!/bin/bash

# Usage: ./deploy.sh [host]

host="${1:-olive@pinot.tharan.org}"

# TODO: put this in an encrypted repo.
scp ~/.personal_chef_secret_key "${host}:"

tar cj . | ssh "$host" 'sudo rm -rf ~/chef && mkdir ~/chef && cd ~/chef && tar xj && sudo bash install.sh'
