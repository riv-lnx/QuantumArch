#!/usr/bin/env bash

# Bersihkan layar
clear

# Warna (ANSI Colors)
GREEN='\033[0;32m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${CYAN}==============================${NC}"
echo -e "${CYAN}   QuantumArch Power Menu     ${NC}"
echo -e "${CYAN}==============================${NC}"
echo ""
echo -e "  [${GREEN}1${NC}]   Shutdown"
echo -e "  [${GREEN}2${NC}]   Reboot"
echo -e "  [${GREEN}3${NC}]   Lock Screen"
echo -e "  [${GREEN}4${NC}]   Logout (Hyprland)"
echo -e "  [${GREEN}5${NC}]   Cancel"
echo ""
echo -e "${CYAN}==============================${NC}"
echo -n "  Choose option [1-5]: "
read choice

case $choice in
    1)
        echo -e "\n${RED}Shutting down...${NC}"
        sleep 1
        systemctl poweroff
        ;;
    2)
        echo -e "\n${GREEN}Rebooting...${NC}"
        sleep 1
        systemctl reboot
        ;;
    3)
        echo -e "\n${CYAN}Locking...${NC}"
        sleep 0.5
        loginctl lock-session
        ;;
    4)
        echo -e "\n${RED}Logging out...${NC}"
        sleep 1
        hyprctl dispatch exit
        ;;
    *)
        echo "Cancelled."
        exit 0
        ;;
esac
