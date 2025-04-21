#!/bin/bash

echo "MODULE 07 -02 NIC Tools and Bonding"

echo ""
echo "[1] List all network interfaces"
ip link

echo ""
echo "[2] Show interface status with nmcli"
nmcli device status 

echo ""
echo "[3] Detailed NIC info with ethtool"
INTERFACE=$(nmcli device status | grep ethernet | awk '{print $1}' | head -n 1)
if [ -n "$INTERFACE" ]; then
	echo "Inspecting interface: $INTERFACE"
	ethtool "$INTERFACE"
else
	echo "No Ethernet interface foudn"

fi

echo ""
echo "[4] Show active kernel modules (NICs)"
lsmod | grep -E 'e1000|igb|ixgbe|r8169|tg3|bnx2|bonding'


echo ""
echo "[5] Checking if bounding module is loaded:"
modprobe --dry-run --verbose bonding


echo ""
echo "[6 Show bondging configuration file path if exist"
if [ -d "/proc/net/bonding" ]; then
	ls /proc/net/bonding
	cat /proc/net/bonding/*
else 
	echo "Bonding not configured on this system."
fi

echo ""
echo "[7] Show interface capabilities (offload,speed,etc)"
if [ -n "$INTERFACE" ]; then
	ethtool -k "$INTERFACE"
else 
	echo " Skipping capability check - no interface detected"
fi


echo ""
echo "DONE"


