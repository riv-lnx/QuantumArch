#!/usr/bin/env bash
# Simple light weather script (wttr.in + jq)
# Default city/timezone: Jakarta
CITY="Jakarta"
# Optionally use TZ if you want to force timezone display (not necessary here)
# TZ="Asia/Jakarta"

# fetch short JSON from wttr.in
raw=$(curl -s "https://wttr.in/${CITY}?format=j1")
if [ -z "$raw" ]; then
  # fallback plain text
  printf '{"icon":"\uf185","text":"N/A","full":"Weather unavailable"}'
  exit 0
fi

temp=$(echo "$raw" | jq -r '.current_condition[0].temp_C')
desc=$(echo "$raw" | jq -r '.current_condition[0].weatherDesc[0].value')

# choose a simple icon (nerd font) based on description (keamanan: use \ufxxx)
icon="\uf185" # default cloud/sun
case "$desc" in
  *Clear*|*Sunny*) icon="\uf185" ;;   # sun/cloud icon (kept generic)
  *rain*|*Rain*|*Showers*) icon="\uf74e" ;; # rain icon fallback
  *Snow*|*snow*) icon="\uf2dc" ;;
  *Cloud*|*cloud*) icon="\uf0c2" ;;
  *) icon="\uf0c2" ;;
esac

# output JSON consumed by Waybar
full="${desc}, ${temp}°C"
printf '{"icon":"%s","text":"%s°C","full":"%s"}' "$icon" "$temp" "$full"
