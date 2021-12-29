#!/usr/bin/bash

current_volume=$($HOME/.config/i3/scripts/get-volume.sh)

function volume_up(){
    if (($current_volume >= 99)); then
        killall dunst; notify-send "[AUDIO] Volume $current_volume %"
    else
        pactl set-sink-volume @DEFAULT_SINK@ +5% && \
            killall dunst; notify-send "[AUDIO] Volume $current_volume %"
    fi
}

volume_up
