#!/usr/bin/bash

$HOME/.config/polybar/launch.sh &
nitrogen --restore &
killall compton && compton &
