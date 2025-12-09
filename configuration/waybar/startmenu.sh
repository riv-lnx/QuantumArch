#!/bin/bash

choice=$(printf " Lock\n󰗼 Logout\n Reboot\n Shutdown\n⏾ Suspend\n⏻ Hibernate" | \
    wofi --dmenu -p "Power Menu")

case "$choice" in
    " Lock")      hyprlock ;;
    "󰗼 Logout")    hyprctl dispatch exit ;;
    " Reboot")    systemctl reboot ;;
    " Shutdown")  systemctl poweroff ;;
    "⏾ Suspend")   systemctl suspend ;;
    "⏻ Hibernate") systemctl hibernate ;;
esac
