#!/usr/bin/env bash

TRA_PROXY="ssh.ult"
CONFIG=~/.ssh/config

proxy_login() {
    echo "Checking tra connection"
    ssh -O check $TRA_PROXY

    if [[ $? -ne 0 ]]
    then
        echo "No connection found. Connecting to TRA"
        ssh -fN $TRA_PROXY
    else
        echo "tra connection already established"
    fi
}

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

##proxy_login
hosts_login
