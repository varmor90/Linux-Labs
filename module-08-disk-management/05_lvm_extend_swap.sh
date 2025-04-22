#!/bin/bash

#require root
if [ "$EUID" -ne 0 ]; then
	echo "Please run this script as root"
	exit 1

fi

echo "MODULE 8 - 05 : EXTEND LVM + CREATE SWAP"

VG_NAME="vg_lab"
SWAP_LV="lv_swap"
SWAP_SIZE="512M"

echo ""
echo "[1] Show existing volume groups and free space"
vgs

echo ""
echo "[2] Create new logical volume for swap "
lvcreate -L $SWAP_SIZE -n $SWAP_LV $VG_NAME

echo ""
echo "[3] Format the LV as swap"
mkswap /dev/$VG_NAME/$SWAP_LV

echo ""
echo "[4] Enable the swap"
swapon /dev/$VG_NAME/$SWAP_LV

echo ""
echo "[5] Show current active swap areas"
swapon --show 

echo ""
echo "[6] Optional: add to /etc/fstab to presis after reboot"
echo "/dev/$VG_NAME/$SWAP_LV	swap	swap	defaults	0	0"

echo ""
echo "DONE"

