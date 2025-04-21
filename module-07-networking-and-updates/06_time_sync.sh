#!/bin/bash

echo "MODOULE 07 - 06: Time Sync and NTP/Chronyd"

echo ""
echo "[1] show current system time"
date

echo ""
echo "[2] show current time zone "
timedatectl | grep "Time zone"

echo ""
echo "[3] Show full timedatectl status"
timedatectl

echo ""
echo "[4] check if chronyd is installed and running"
systemctl status chronyd || echo "chronyd not installed or not running"

echo ""
echo "[5] show cronyd trancking (requires chronyc)"
chronyc tracking 2>/dev/null || echo "chronyc command not found"

echo ""
echo "[6] List NTP sources known to chronyd"
chronyc sources 2>/dev/null || echo "chronyc not available"

echo ""
echo "[7] Show chrony configuration file (read-only)"
head -n 15 /etc/chrony.conf

echo ""
echo "DONE"

