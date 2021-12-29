#!/usr/bin/bash
function get_volume_percent(){
    result=$(pactl get-sink-volume @DEFAULT_SINK@)

    if [[ $result =~ [[:space:]]*([0-9])+%[[:space:]] ]]; then
        sed_result=$(echo ${BASH_REMATCH[0]} | sed 's/%//')
        echo $sed_result
    fi
}

get_volume_percent
