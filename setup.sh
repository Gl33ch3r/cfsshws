#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
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
# Link Hosting You For Ssh Vpn
sshlink="raw.githubusercontent.com/Gl33ch3r/cfsshws/main/ssh"
# Link Hosting You For Sstp
# gl33chervpnn="raw.githubusercontent.com/Gl33ch3r/cfsshws/main/sstp"
# Link Hosting You For Ssr
# gl33chervpnnn="raw.githubusercontent.com/Gl33ch3r/cfsshws/main/ssr"
# Link Hosting You For Shadowsocks
# gl33chervpnnnn="raw.githubusercontent.com/Gl33ch3r/cfsshws/main/shadowsocks"
# Link Hosting You For Wireguard
# gl33chervpnnnnn="raw.githubusercontent.com/Gl33ch3r/cfsshws/main/wireguard"
# Link Hosting You For Xray
xraylink="raw.githubusercontent.com/Gl33ch3r/cfsshws/main/xray"
# Link Hosting You For Ipsec
# gl33chervpnnnnnnn="raw.githubusercontent.com/Gl33ch3r/cfsshws/main/ipsec"
# Link Hosting You For Backup
backuplink="raw.githubusercontent.com/Gl33ch3r/cfsshws/main/backup"
# Link Hosting You For Websocket
websocketlink="raw.githubusercontent.com/Gl33ch3r/cfsshws/main/websocket"
# Link Hosting You For Ohp
ohplink="raw.githubusercontent.com/Gl33ch3r/cfsshws/main/ohp"
# link Hosting update
updatelink="raw.githubusercontent.com/Gl33ch3r/cfsshws/main/update"
# link Hosting sslh-fix
sslhlink="raw.githubusercontent.com/Gl33ch3r/cfsshws/main/sslh-fix"

MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
ALLOWEDIP=$(curl https://raw.githubusercontent.com/Gl33ch3r/cfsshws/main/ipvps.txt | grep $MYIP)
if [ $MYIP == $ALLOWEDIP ]; then
echo -e "${NC}${GREEN}Permission Accepted...${NC}"
else
echo -e "${NC}${RED}Permission Denied!${NC}";
exit 0
fi
clear
rm -f setup.sh
clear
if [ -f "/etc/xray/domain" ]; then
echo "Script Already Installed"
exit 0
fi

mkdir /var/lib/gl33ch3rvpn;

wget https://${sshlink}/newhost.sh && chmod +x newhost.sh && ./newhost.sh
sleep 1
#install v2ray
wget https://${xraylink}/ins-xray.sh && chmod +x ins-xray.sh && screen -S xray ./ins-xray.sh
#install ssh ovpn
wget https://${sshlink}/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
# Websocket
wget https://${websocketlink}/edu.sh && chmod +x edu.sh && ./edu.sh
# OphvServer
wget https://${ohplink}/ohp.sh && chmod +x ohp.sh && ./ohp.sh
#Setting Backup
wget https://${backuplink}/set-br.sh && chmod +x set-br.sh && ./set-br.sh
# Update Menu
wget https://${updatelink}/getupdate.sh && chmod +x getupdate.sh && ./getupdate.sh
# sslh fix
wget https://${sslhlink}/sslh-fix.sh && chmod +x sslh-fix.sh && ./sslh-fix.sh
#restart service
restart

rm -f /root/cf.sh
rm -f /root/ssh-vpn.sh
rm -f /root/sslh-fix.sh
rm -f /root/getupdate.sh
rm -f /root/ins-xray.sh
rm -f /root/ipsec.sh
rm -f /root/set-br.sh
rm -f /root/edu.sh
rm -f /root/ohp.sh
rm -f /root/addhost.sh
rm -f /root/newhost.sh
cat <<EOF> /etc/systemd/system/autosett.service
[Unit]
Description=autosetting
Documentation=https://t.me/Gonfreecs600

[Service]
Type=oneshot
ExecStart=/bin/bash /etc/set.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable autosett
wget -O /etc/set.sh "https://${sshlink}/set.sh"
chmod +x /etc/set.sh
sslh-fix-reboot
history -c
echo "1.2" > /home/ver
echo " "
echo "Installation has been completed!!"
echo " "
echo "=================================-Gl33ch3r Project-===========================" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "----------------------------------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 443, 22"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 990"  | tee -a log-install.txt
echo "   - Stunnel5                : 443, 445, 777"  | tee -a log-install.txt
echo "   - Dropbear                : 443, 109, 143"  | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8080"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 89"  | tee -a log-install.txt
echo "   - XRAYS Vmess TLS         : 8443"  | tee -a log-install.txt
echo "   - XRAYS Vmess None TLS    : 80"  | tee -a log-install.txt
echo "   - XRAYS Vless TLS         : 8443"  | tee -a log-install.txt
echo "   - XRAYS Vless None TLS    : 80"  | tee -a log-install.txt
echo "   - XRAYS Trojan            : 2083"  | tee -a log-install.txt
echo "   - Websocket TLS           : 443"  | tee -a log-install.txt
echo "   - Websocket None TLS      : 8880"  | tee -a log-install.txt
echo "   - Websocket Ovpn          : 2086"  | tee -a log-install.txt
echo "   - OHP SSH                 : 8181"  | tee -a log-install.txt
echo "   - OHP Dropbear            : 8282"  | tee -a log-install.txt
echo "   - OHP OpenVPN             : 8383"  | tee -a log-install.txt
echo "   - Tr Go                   : 2087"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Manila (GMT +8)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 06.00 GMT +8" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "---------------------- Script Mod By Gl33ch3r ----------------------" | tee -a log-install.txt
echo ""
echo " Reboot 15 Sec"
sleep 15
rm -f setup.sh
reboot
