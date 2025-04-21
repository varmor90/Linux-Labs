#!/bin/bash
#Please run this script as root only 

echo " MODULE 07 - 08 : Lgging and pasic os Hardening"

echo ""
echo "[1] check if rsyslog service is running"
systemctl status rsylog --no-pager || echo "rsylog not active"

echo ""
echo "[2] Show recent system logs"
tail -n 10 /var/log/messages || echo "/var/log/messages not found"

echo ""
echo "[3] Show auth logs "
tail -n 10 /var/log/secure 2>/dev/null || tail -n 10 /var/log/auth.log || echo "no auth log found"

echo ""
echo "[4] check if audid is installed"
command -v auditctl && echo "auditd is installed" || echo "auditd not found"


echo ""
echo "[5] check if firewalld is running "
systemctl is-active --quiet firewalld && echo "firewalld is active" || echo "firewalld not found"

echo ""
echo "[6] check if root login via SSH is disabled"
grep "^PermitRootLogin" /etc/ssh/sshd_config || echo "no root login config found"

echo ""
echo "[7] Show file premissions on /etc/shadow (should be 000 or 400)"
ls -l /etc/shadow

echo ""
echo "[8] List users with UID 0 (should be only root)"
awk -F: '$3 == 0 {print$1}' /etc/passwd

echo ""
echo "[9] Show recent failed login attepmts"
lastb | head -n 5 || echo "lastb command not avbailable"

echo ""
echo "DONE"


