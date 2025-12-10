#!/bin/bash
# Script untuk membuka App Launcher (Wofi)

if pgrep -x "wofi" > /dev/null
then
    pkill -x wofi
else
    # Pastikan wofi terinstall
    wofi --show drun --allow-images --prompt "Quantum Apps..."
fi
