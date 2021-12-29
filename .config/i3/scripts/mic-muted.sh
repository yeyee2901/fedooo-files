#!/usr/bin/bash

function get_mute_status(){
    result=$(pactl get-source-mute @DEFAULT_SOURCE@)
    echo $result
}

function notify_muted() {
    pactl set-source-mute @DEFAULT_SOURCE@ toggle && \
        {
            killall dunst; notify-send "[MIC] $(get_mute_status)"
        }
}

notify_muted
