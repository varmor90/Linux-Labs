#!/bin/bash

echo "MODULE 08 - 01 Runlevels and Boot process"

echo ""
echo "[1] Show current runlevel"
runlevel

echo ""
echo "[2] Show default systemd target"
systemctl get-default

echo ""
echo "[3] List of available targets"
systemctl list-units --type=target --all

echo ""
echo "[4] Show boot time with systemd-analyze"
systemd-analyze

echo ""
echo "[5] Show services by time taken during boot"
systemd-analyze blame | head -n 15

echo ""
echo "[6] Show critical path in boot process"
systemd-analyze critical-chain

echo ""
echo "[7] show init system"
INIT_SYSTEM=$(ps -p 1 -o comm=)
echo "Init system in use: $INIT_SYSTEM"


echo ""
echo "[8] Show enabled services that start at boot"
systemctl list-unit-files --state=enabled | grep service

echo ""
echo "DONE"

