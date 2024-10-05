#!/usr/bin/env bash

TRA_PROXY="ssh.ult"
CONFIG=~/.ssh/config

hosts_login() {
    hosts=$(awk '/Host / {print $2}' $CONFIG)

    for host in $hosts
    do
        ssh -O check $host
    
        if [[ $? -ne 0 ]]
        then
            echo "Connecting to $host"
            ssh -fN $host
        else
            echo "$host connection already established"
        fi
    done
}

eval `keychain --eval ~/.ssh/id_ed25519`
ssh-add ~/.ssh/id_rsa

hosts_login
