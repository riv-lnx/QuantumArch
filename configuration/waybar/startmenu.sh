#!/usr/bin/env bash
# Start menu: opens wofi drun; includes power submenu implemented inline
# If user chooses "Power", show power options.

CHOICE=$(printf "Launch apps\nPower options\nLock screen" | wofi --dmenu --location 3 --prompt "Quantum Menu" --width 380)
case "$CHOICE" in
  "Launch apps")
    wofi --show drun
    ;;
  "Power options")
    P=$(printf "Lock\nLogout\nSuspend\nReboot\nShutdown" | wofi --dmenu --prompt "Power")
    case "$P" in
      "Lock") hyprlock ;;
      "Logout") hyprctl dispatch exit 0 ;;
      "Suspend") systemctl suspend ;;
      "Reboot") systemctl reboot ;;
      "Shutdown") systemctl poweroff ;;
    esac
    ;;
  "Lock screen")
    hyprlock
    ;;
esac
