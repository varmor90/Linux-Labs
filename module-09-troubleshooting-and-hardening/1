#!/bin/bash

echo "MODULE 9 : 06 IP Assigned but no Connection"

echo ""
echo "[1] checking active interfaces and IPs"
ip addr show | grep 'inet '

echo ""
echo "[2] Default route"
ip route show | grep default

echo ""
echo "[3] trying to ping 8.8.8.8 (goodle DNS)"
ping -c 2 8.8.8.8

if [ $? -ne 0 ]; then
	echo ""
	echo "PING failed Something is wrong with the network"
else
	echo ""
	echo "Ping successful - network reachable"
fi

echo ""
echo "[4] Checking if DNS works (google.com)"
ping -c 2 goodle.com

echo ""
echo "[5] Checkinf DNS resolver config:"
cat /etc/resolv.conf

echo ""
echo "[6] checkinf firewall status"
if sustemctl is-active --quiet firewalld; then
	firewall-cmd --state
	echo "Zones and rules"
else
	echo "FirewallD not running or not installed"
fi

echo ""
echo "[7] Checking for open ports"
ss -tuln


echo ""
echo "[8] Suffestions if ping fails"
echo "- check if interface is up : nmcli device status"
echo "- Restart NetworkManager : systemctl restart Networkmanager"
echo "- Veryfi no typos in /etc/sysconfig/network-scripts/"
echo "- Disable firewalld temporarily : systemctl stop firewalld"
echo "- Try static IP config if DHCP fails"


echo ""
echo "DONE"



