#!/bin/bash
# Proxy For Edukasi & Imclass
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
clear
# Link Hosting Kalian
akbarvpn="raw.githubusercontent.com/Gl33ch3r/cfsshws/main/websocket"

# Getting Proxy Template
wget -q -O /usr/local/bin/ws-nontls https://${akbarvpn}/websocket.py
#cp /root/myproject/websocket/websocket.py /usr/local/bin/ws-nontls
chmod +x /usr/local/bin/ws-nontls

# Installing Service
cat > /etc/systemd/system/ws-nontls.service << END
[Unit]
Description=Python Proxy Mod By Gl33ch3r
Documentation=https://t.me/Gonfreecs
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-nontls 8880
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable ws-nontls
systemctl restart ws-nontls

# Getting Proxy Template
wget -q -O /usr/local/bin/ws-ovpn https://${akbarvpn}/ws-ovpn.py
#cp /root/myproject/websocket/ws-ovpn.py /usr/local/bin/ws-ovpn
chmod +x /usr/local/bin/ws-ovpn

# Installing Service
cat > /etc/systemd/system/ws-ovpn.service << END
[Unit]
Description=Python Proxy
Documentation=https://t.me/Gonfreecs
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-ovpn 2086
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable ws-ovpn
systemctl restart ws-ovpn

# Getting Proxy Template
wget -q -O /usr/local/bin/ws-tls https://${akbarvpn}/ws-tls

chmod +x /usr/local/bin/ws-tls

# Installing Service
cat > /etc/systemd/system/ws-tls.service << END
[Unit]
Description=Python Proxy
Documentation=https://t.me/Gonfreecs
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-tls 443
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable ws-nontls
systemctl restart ws-nontls
systemctl enable ws-tls
systemctl restart ws-tls
sleep 3
