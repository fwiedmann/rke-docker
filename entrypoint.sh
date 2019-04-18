#!/usr/bin/env bash

set -e

if [[ -z "$DEBUG" ]]; then
    set -x
fi

# check if ssh key is mounted
if [[ ! -f "/home/rke/.id_rsa"  ]];then
    echo 'No private ssh-key was found. Please mount the key like this: "/home/rke/id_rsa"'
    exit 1
fi

# copy ssh-key to users ssh-fodler to prevent issues with ownership
cp .id_rsa .ssh/id_rsa

# change owner of ssh key to container user
chown rke:rke /home/rke/.ssh/id_rsa
chmod 0600 /home/rke/.ssh/id_rsa

# step down from root and  run rke with args
su rke -c "/usr/local/bin/rke $*"