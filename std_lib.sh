#!/usr/bin/env bash

# Snarf out the program name of the script that is importing this lib.
declare tmp=$(ps -eo pid,command | grep -w $$ | grep -v grep | sed -e 's/-[a-zA-Z0-9]* //g' | awk '{print $3}')
declare -r prog=${tmp##*/} && unset tmp

timestamp () {
    date +%FT%T.%N
}

log () {
    local -r msg=$1
    local level=$2

    if [ -z $level ]; then
        level='INFO'
    fi

    log_msg="[$(timestamp)] [$prog] - $level - $msg"

    if [ $level == 'ERROR' ]; then
        echo $log_msg 1>&2
    else
        echo $log_msg
    fi
}

log_err () {
    local -r msg=$1
    log "$msg" 'ERROR'
}
