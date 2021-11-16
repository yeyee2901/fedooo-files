#!/usr/bin/env bash

killall -q polybar

# echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log

if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload main &
    done
else
    polybar main 2>&1 | tee -a /tmp/polybar1.log & disown
fi
