#!/usr/bin/bash

$HOME/.config/polybar/launch.sh &
nitrogen --restore &
flameshot &
killall picom ; picom --config $HOME/.config/picom.conf &
