#!/usr/bin/env bash

echo "=== QuantumArch Start Menu ==="
echo "1) Shutdown"
echo "2) Reboot"
echo "3) Lock"
echo "4) Logout"
echo "5) Cancel"
echo -n "Choose: "
read choice

case $choice in
    1) systemctl poweroff ;;
    2) systemctl reboot ;;
    3) loginctl lock-session ;;
    4) hyprctl dispatch exit ;;
    *) exit 0 ;;
esac
