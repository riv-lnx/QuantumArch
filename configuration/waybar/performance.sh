#!/bin/bash

cpu=$(grep -o '^[0-9]*' /proc/loadavg)
mem=$(free -m | awk '/Mem:/ {print int($3/$2 * 100)}')

echo "CPU ${cpu}% • RAM ${mem}%"
