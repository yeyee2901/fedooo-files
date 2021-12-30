#!/usr/bin/bash

$HOME/.config/polybar/launch-i3.sh &
nitrogen --restore &
flameshot &
killall picom ; picom --config $HOME/.config/picom.conf &
