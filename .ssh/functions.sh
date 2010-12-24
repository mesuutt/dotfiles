#!/bin/bash

SSH_CONF_DIR="$HOME/.ssh"
SSH_AGENT_INFO="$SSH_CONF_DIR/ssh_agent_info"

create_agent() {
    ssh-agent > $SSH_AGENT_INFO
    chmod 600 $SSH_AGENT_INFO
}

read_agent_info() {
    test -f $SSH_AGENT_INFO && source $SSH_AGENT_INFO > /dev/null
}

add_keys() {
    KEY_LIST=`find $SSH_CONF_DIR -name "id_rsa*"|grep -v pub`
    read_agent_info
    for key in $KEY_LIST; do
        ssh-add $key
    done
}

kill_agent() {
    read_agent_info
    if is_running; then
        kill $SSH_AGENT_PID
        rm $SSH_AGENT_INFO
    fi
}

is_running() {
    read_agent_info

    test -z $SSH_AGENT_PID && return 1

    if ps -p $SSH_AGENT_PID > /dev/null; then
        # it's running
        return 0
    else
        # it's NOT running
        return 1
    fi
}

