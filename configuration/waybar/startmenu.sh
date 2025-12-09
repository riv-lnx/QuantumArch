#!/bin/bash

CHOICE=$(zenity --list --title="START MENU" --column="Action" Lock Logout Reboot Shutdown Suspend)

case "$CHOICE" in
  Lock)
    hyprlock
    ;;
  Logout)
    hyprctl dispatch exit
    ;;
  Reboot)
    systemctl reboot
    ;;
  Shutdown)
    systemctl poweroff
    ;;
  Suspend)
    systemctl suspend
    ;;
esac
