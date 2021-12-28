#!/usr/bin/bash

rofi_command="rofi -theme $HOME/.config/rofi/rofi-scripts/powermenu/theme.rasi"

# Options
shutdown=""
reboot=""
logout=""
options="$shutdown\n$reboot\n$logout"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 2)"

case $chosen in
    $shutdown)
        systemctl poweroff
        ;;

    $reboot)
        systemctl reboot
        ;;

    $logout)
        i3-msg exit
        ;;
esac
