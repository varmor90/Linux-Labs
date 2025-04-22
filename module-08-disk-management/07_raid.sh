#!/bin/bash

#Require root
if [ "$EUID" -ne 0 ]; then
	echo "Please run this script as root"
	exit 1
fi

echo "MODULE 8 -07: software RAID Demo (mdadm)"

echo ""
echo "[1] Creating two 100MB fake disc files" 
dd if=/dev/zero of=/tmp/disk1.img bs=1M count=100 status=none
dd if=/dev/zero of=/tmp/disk2.img bs=1M count=100 status=none

echo ""
echo "[2] Creating loop devices"
LOOP1=$(losetup --find --show /tmp/disk1.img)
LOOP2=$(losetup --find --show /tmp/disk2.img)
echo "Loop devices $LOOP1 and $LOOP2"

echo ""
echo "[3] Creating RAID 1 array with mdadm"
mdadm --create --verbose /dev/md0 --level=1 --raid-devices=2 $LOOP1 $LOOP2

echo ""
echo "[4] Waiting for a moment for RAID to initialize"
sleep 3

echo ""
echo "[5] Showing RAID status"
cat /proc/mdstat

echo ""
echo "[6] Formatting Raid with ext4 and mounting"
mkfs.ext4 /dev/md0
mkdir -p /mnt/raidtest
echo "RAID mounted at /mnt/raidtest"

echo ""
echo "[7] Writing test file to RAID"
echo "RAID test ok" > /mnt/raidtest/test.txt
cat /mnt/raidtest/test.txt


echo ""
echo "[8] Cleanup - umount and remove RAID (if needed)"
echo "to clean up manually:"
echo "umount /mnt/raidtest"
echo "mdadm --stop $LOOP1 $LOOP2"
echo "rm /tmp/disk1.img /tmp/disk2.img"


echo ""
echo "DONE"


