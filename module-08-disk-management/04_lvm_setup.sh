#!/bin/bash

#require root
if [ "$EUID" -ne 0 ]; then
	echo "please run this script as root"
	exit 1
fi


echo "MODULE 8 - 04 : LVM setup from Scratch"
#variables (can be customized)

DISK="/dev/sdb1"
VG_NAME="vg_lab"
LV_NAME="lv-lab"
MOUNT_POINT="/mnt/lvmtest"

echo ""
echo "[1] checking if $DISK exist and is unused"
if [ ! -b "$DISK" ]; then
	echo "Disk $DISK not found. exiting"
	exit 1
fi 

echo ""
echo "[2] Creating Physical Volume on $DISK"
pvcreate $DISK

echo ""
echo "[3] Creating Volume Group ($VG_NAME)"
vgcreate $VG_NAME $DISK


echo ""
echo "[4] Creating Logical Volume ($LV_NAME - size 500MB)"
lvcreate -L 500M -n $LV_NAME $VG_NAME

echo ""
echo "[5] Formatting LV with ext4"
mkfs.ext4 /dev/$VG_NAME/$LVNAME

echo ""
echo "[6] Creating mount point and mounting"
mkdir -p $MOUNT_POINT
mount /dev/$VG_NAME/$LV_NAME $MOUNT_POINT

echo""
echo "[7]Veryfing"
lsblk
df -h | grep $MOUNT_POINT
vgs
lvs

echo ""
echo "LVM SUCCESSFULLY CREATED AND MOUNTED AT $MOUNT_POINT"
echo "To mount it automatically at boot, add to /etc/fstab"
echo "/dev/$VG_NAME/$LV_NAME $MOUNT_POINT	ext4	defaults	0	0"

echo ""
echo "DONE"

