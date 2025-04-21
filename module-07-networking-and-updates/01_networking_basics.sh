#!/bin/bash

echo "MODULE 7 -01 Networking Basics"

echo ""
echo "[1] Checking IP addresses"
ip a
ifconfig 


echo ""
echo "[2] checking routing table "
ip r
echo ""
route -n

echo ""
echo "[3] Testing internet connectivity (google.com) "
ping -c 3.8.8.8.8

echo ""
echo "[4] Checking DNS settings:"
cat /etc/resolv.conf

echo ""
echo "[5] Checking hostname and hosts file"
hostname 
cat /etc/hosts

echo ""
echo "[6] checking open network connetions:"
netstat -tuln
ss -tuln 

echo ""
echo "[7] checking interfaces "
tcpdump -D

echo ""
echo "[8] NetworkManager - controled inferfaces:"
nmcli device status

echo ""
echo "DONE"



