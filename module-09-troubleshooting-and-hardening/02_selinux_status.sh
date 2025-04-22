#!/bin/bash

echo "MODULE 9 : SELinux Status & Control"

echo ""
echo "[1] Current SELinux mode"
getenforce

echo ""
echo "[2] Detailed SELinux status "
sestatus

echo ""
echo MODE=$(getenforce)

if [ "$MODE" = "Enforcing" ]; then
	echo ""
	echo "[3] Swiching to premissive mode temporarily (untill reboot)"
	sudo setenforce 0
	echo "New Mode: $(getenforce)"
elif [ "$MODE" = "Premissive" ]; then
	echo ""
	echo "[3] SELinux Disabled"
fi


echo ""
echo "[4] to change SELinux mode permanently:"
echo " Edit the file /etc/selinux/config"
echo "Then reboot the ststem to apply"


echo ""
echo "DONE"


