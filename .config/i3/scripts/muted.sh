#!/usr/bin/bash

function get_mute_status(){
    result=$(pactl get-sink-mute @DEFAULT_SINK@)
    echo $result
}

function notify_muted() {
    pactl set-sink-mute @DEFAULT_SINK@ toggle && \
        {
            killall dunst; notify-send "[AUDIO] $(get_mute_status)"
        }
}

notify_muted
