#!/bin/bash

case "$1" in
    cpu)
        value=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {printf "%d%%", usage}')
        echo "CPU $value"
        ;;

    cpu-full)
        top -bn1 | head -n 5
        ;;

    ram)
        value=$(free -m | awk '/Mem/ {printf "%d%%", $3*100/$2}')
        echo "RAM $value"
        ;;

    ram-full)
        free -h
        ;;
esac
