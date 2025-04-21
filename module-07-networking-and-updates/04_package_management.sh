#!/bin/bash

echo "MODULE 07 - 04 Package Management"


echo ""
echo "[1] List enabled respositories :"
yum repolist

echo ""
echo "[2] check if 'nano' is installed :"
rpm -q nano 

echo ""
echo "[3] Installing 'nano' if not installed"
yum install -y nano#


echo ""
echo "[4] Show info about nano package"
yum info nano

echo ""
echo "[5] check installed packages containing nano"
rpm -qa | grep nano 

echo ""
echo "[6] Remove nano package "
yum remove -y nano

echo ""
echo "[7] search for available packages with 'wget' in name "
yum search wget

echo ""
echo "[8] View recent yum history"
yum history

echo ""
echo "[9] Update package index and check for updates"
yum check-update

echo ""
echo "[10] simulate full system update"
echo "(dry run only)"
yum update --assumeno


echo ""
echo "[11]checking repo files (symbolic local repo)"
ls -l /etc/yum.repos.d/

echo ""
echo "[12] Show release info:"
cat /etc/*release

echo ""
echo "DONE"



