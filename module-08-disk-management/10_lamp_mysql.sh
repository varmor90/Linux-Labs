#!/bin/bash

#REQIORE ROOT

if [ "$EUID" -ne 0 ]; then
	echo "please run this script as root"
	exit 1
fi


echo "MODULE 8 - 10: INSTALL LAMP STACK"

echo ""
echo "[1] Installing Apache, PHP, Maria DB"
dnf install -y httpd php mariadb-server php-mysqlnd &>/dev/null


echo ""
echo "[2] Enabling and starting services"
systemctl enable --now httpd
systemctl enable --now mariadb

echo ""
echo "[3] Setting Firewall rules "
if systemctl is-active --quiet firewalld; then
	firewall-cmd --permanent -add-service=http
	firewall-cmd reload
else
	echo "Firewalld not running or not installed"
fi

echo ""
echo "[4] Creating test PHP file"
curl -s http://localhost | grep -i php

echo ""
echo "[6] Securing MariaDB (manual step recommended)"
echo "run 'mysql_secure_instalation' to sercure DB (root password, remove test DB . etc.)"

echo ""
echo "DONE"
echo "Visit gttp://localhost in your browser or use : curl http://localhost"


