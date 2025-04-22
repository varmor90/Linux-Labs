#!/bin/bash

#REQUIRE ROOT

if [ "EUID" -ne 0 ]; then
	echo "Please run this script as root"
	exit 1
fi

echo "MODULE 8 -08: Disk Check and Backup (fsck, xfs_repair, dd)"


DISK_IMG="/tmp/testdisk.img"
DISK_SIZE="100m"
MOUNT_POINT="/mnt/diskcheck"

echo ""
echo "[1] Creating $DISK_SIZE test disk image"
dd if=/dev/zero of=$DISK_IMG bs=1M count=100 status=none

echo ""
echo "[2] Creating loop device"
LOOP_DEV=$(losetup --find --show $DISK_IMG)
echo "Loop Device created $LOOP_DEV"

echo ""
echo "[3] Formatting with ext4 (can be xfs)"
mkfs.ext4 $LOOP_DEV

echo ""
echo "[4] Mounting to $MOUNT_POINT and writing test file"
mkdir -p $MOUNT_POINT
mount $LOOP_DEV $MOUNT_POINT
echo "backup test file" > $MOUNT_POINT/file.txt

echo ""
echo "[5] Checking file using fsck:"
fsck -n $LOOP_DEV

echo ""
echo "[6] Making raw backup with dd "
dd if=$LOOP_DEV of=/tmp/backup_testdisk.img bs=1 status=progress


echo ""
echo "[7] Verifying backup file"
ls -lh /tmp/backup_testdisk.img

echo ""
echo "[8] Clean up loop device "
losetup -d $LOOP_DEV

echo ""
echo "DONE"


