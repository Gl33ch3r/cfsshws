#!/bin/bash
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
ALLOWEDIP=$(curl https://raw.githubusercontent.com/Gl33ch3r/cfsshws/main/ipvps.txt | grep $MYIP)
if [[ $MYIP == $ALLOWEDIP ]]; then
echo -e "${NC}${GREEN}Permission Accepted...${NC}"
else
echo -e "${NC}${RED}Permission Denied!${NC}";
exit 0
fi
clear
lizupdate="raw.githubusercontent.com/Gl33ch3r/cfsshws/main/update"
# change direct
cd /usr/bin
# remove file
rm menu
rm -rf menu
# Download update
wget -O menu "https://${lizupdate}/menu.sh"
wget -O maddssh "https://${lizupdate}/maddssh.sh"
wget -O mbackup "https://${lizupdate}/mbackup.sh"
wget -O maddxray "https://${lizupdate}/maddxray.sh"
wget -O msetting "https://${lizupdate}/msetting.sh"
wget -O start-menu "https://${lizupdate}/start-menu.sh"
# change Permission
chmod +x menu
chmod +x maddssh
chmod +x maddxray
chmod +x mbackup
chmod +x msetting
chmod +x start-menu
#change direct
cd /root
# clear
clear
echo -e "Succes Update Menu"
sleep 3
