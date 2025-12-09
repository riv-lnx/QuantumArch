#!/bin/bash

raw=$(curl -s "https://wttr.in/?format=j1")

temp=$(echo "$raw" | jq -r ".current_condition[0].temp_C")
desc=$(echo "$raw" | jq -r ".current_condition[0].weatherDesc[0].value")

# Simple icon
icon="\uf185"  # sun

echo "{\"temp\":\"${temp}°C\",\"icon\":\"$icon\",\"full\":\"$desc ${temp}°C\"}"
