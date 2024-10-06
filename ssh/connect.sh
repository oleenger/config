#!/usr/bin/env bash

TRA_PROXY="ssh.ult"
CONFIG=~/.ssh/config
SSH_KEYFILE="~/.ssh/id_ed25519"

hosts_login() {
    hosts=$(awk '/Host / {print $2}' $CONFIG)

    for host in $hosts
    do
        ssh -O check $host
    
        if [[ $? -ne 0 ]]
        then
            echo "Connecting to $host"
            ssh -fN $host -q
        else
            echo "$host connection already established"
        fi
    done
}

eval `keychain --eval $SSH_KEYFILE`
ssh-add ~/.ssh/id_ed25519
hosts_login
