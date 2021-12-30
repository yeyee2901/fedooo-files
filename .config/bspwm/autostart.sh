#!/usr/bin/bash

$HOME/.config/polybar/launch-bspwm.sh &
nitrogen --restore &
flameshot &
killall picom ; picom --config $HOME/.config/picom.conf &
sxhkd &
nm-applet &
