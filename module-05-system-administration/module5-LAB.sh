#!/bin/bash

echo "===MODULE5 LAB==="

echo ""
echo "[1] Testing vi editor"
echo "This is a sample line" > vi_test.txt
read -p "Press Enter after editing..."


echo ""
echo "[2] Using sed to replace text"
sed 's/sample/edited' vi_test.txt > vi_test_sed.txt
echo "modified file content:"
cat vi_test_sed.txt

echo ""
echo "[3] Creating a test user" 
sudo useradd testuser
echo "Set password for testuser"
sudo passwd testuser

echo ""
echo "[4] Modifying user / adding to wheel group"
sudo usermod -aG wheel testuser
id testuser

echo ""
echo "[5] Swiching to user"
echo "try: su - testuser or sudo -i"
read -p "Press Enter when you're bacl"

echo""
echo "[6] Monitoring users"

who 
w
id 

echo ""
echo"[7]messaging users"
echo "you can try in another terminal: write testuser"
echo "Or broadcast with: wall 'System maintenance in 5 minutes'"
read -p "Try now and press ENTER"



echo "[8] Viewing system info and utility commands"
date
uptime
hostname
which bash
cal
echo "5+3" | bc

echo ""
echo "[9]checking processes and scheduling"
ps aux | head -n5
top -bn1 | head -n 10
echo "sleeping 10s then killing"
sleep 10 &
kill $!

echo ""
echo "[10] setting cron job"
echo "run: contrab -e to edit cron tasks"
read -p "press ENTER after reviewing crontab"

echo ""
echo "[11] System monitoring commands"
df -h
dmesg | tail -n 5
free -m
command -v iostat && iostat 1 2 || echo "install sysstat to use iostat"
command -v netstat && netstat -tuln || echo "install net-tools to use netstat"

echo ""
echo "[12] maintenance commands"
echo "run manually if needed : shutdown, reboot, halt"
runlevel

echo ""
echo "[13] Change hostname"
echo "current hostname:"
echo "current runlevel: $(runlevel)"
#hostnamectl set-hostname newhostname

echo ""
echo [14] System info and architecture
uname -a 
cat /etc/*release* | head -n 1
sudo demidecode -t system | grep -i 'Product\|Vendor'
arch


echo ""
echo "[16] recover root password - test only on VM in single user mode"

echo ""
echo "[17] Generate sosreport"
sudo sosreport

echo ""
echo "LAB DONE"



