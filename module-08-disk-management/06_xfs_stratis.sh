#!/bin/bash

#Require root

if [ "$EUID" -ne 0 ]; then
	echo "Please run this script as root"
	exit 1
fi

echo "MODULE 8- 06 xfs_info and Stratis basics"

echo ""
echo "[1] check which paritions use XFS"
lsblk -f | grep xfs

echo ""
echo "[2] Run xfs_info on monted XFS volume"
#change this path to used XFS mount (e.g. / )
XFS_MOUNT="/"

if mount | grep -q "$XFS_MOUNT"; then
	echo "Running xfs_info on $XFS_MOUNT:"
	xfs_info $XFS_MOUNT
else 
	echo "$XFS_MOUNTis not mounted. skipping xfs_info."
fi

echo "" 
echo "[3] Check if Stratis is installed"
if command -v stratis > /dev/null; then
	echo "Stratis is installed"
	stratis --version
else
	echo "Stratis not installed"
	echo "sudo dnf install -y starisd stratis-cli"
fi

echo ""
echo "[4] check stratisd status if installed"
systemctl status stratisd --no-pager || echo "stratisd not runnig or not installed"

echo ""
echo "Note: Stratis is like LVM but higher level - easier to manage, snapshots,pools, etc."
echo "for real testing : create two disks, run : stratis pool create mypool /dev/sdb/ dev/sdc"


echo ""
echo "DONE"


