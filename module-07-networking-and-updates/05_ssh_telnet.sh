#!/bin/bash

echo "MODULE 07 - 05 SSH, Telnet and DNS tools"

echo ""
echo "[1] check if SSH client is available"
command -v && echo "SSH is available" || echo "SSH not available"

echo ""
echo "[2] check if SSH server is running"
systemctl status ssh --no-pager || echo "sshd not running or not installed"

echo ""
echo "[3] Example SSH connection (not executed)"
echo "ssh unsername@remote -ip"

echo ""
echo "[4] check if Telnet is available"
command -v telnet && echo "telnet is available" || echo "telnet not found"

echo ""
echo "[5] Example telnet usage (not executed)"
echo "telnet towel.blinkenlights.nl"

echo ""
echo "[6] Show configured DNS servers:"
cat /etc/resolv.conf

echo ""
echo "[7] Test DNS resolution with nslookup"
nslookup example.com

echo ""
echo "[8] Test DNS resolution with dig"
dig example.com +short

echo ""
echo "[9] Use host to get it adress of domain:"
host github.com

echo ""
echo "[10] check reverse DNS for an IP"
dig -x 8.8.8.8 +short

echo ""
echo "DONE"

