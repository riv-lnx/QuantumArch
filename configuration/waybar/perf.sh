#!/usr/bin/env bash
# keluarkan JSON: {"text":"<icon>","tooltip":"CPU: x%\\nRAM: yMB"}
CPU=$(awk -v FS=" " '/cpu /{usage=($2+$4)*100/($2+$4+$5); printf "%d", usage}' /proc/stat)
RAM_USED=$(free -m | awk '/Mem:/ {print $3}')
ICON="\uf201"
TOOLTIP="CPU: ${CPU}%\nRAM: ${RAM_USED} MB"
# JSON with fields text and tooltip
printf '{"text":"%s","tooltip":"%s"}' "$ICON" "$TOOLTIP"
