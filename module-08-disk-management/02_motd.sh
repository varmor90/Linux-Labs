#!/bin/bash

echo " MODULE 8 - 02: Message Of The Day"

echo ""
echo "[1] show current MOTD"
cat /etc/motd

echo ""
echo "[2] Add Static custom MOTD"
echo "Welcome to the Linux Lab!" | sudo tee /etc/motd > /dev/null

echo ""
echo "[3] Append dynamic info to MOTD (hostname, uptime, date)"
{
	echo ""
	echo "Hostname: $(hostname)"
	echo "Uptime: $(uptime -p)"
	echo "Date: $(date)"
} | sudo tee -a /etc/motd > /dev/null

echo ""
echo "[4] Show new MOTD"
cat /etc/motd

echo ""
echo "DONE"


