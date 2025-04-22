#!/bin/bash
#best to run the script as root
echo "MODULE 8 - 03 : Disk Usage and Partitions"

echo ""
echo "[1] Show current disk usage"
df -h

echo ""
echo "[2] Show block devices "
lsblk

echo ""
echo "[3] List disk and partitions (detailed)"
sudo fdisk -l


echo ""
echo "[4] Check disk usage of current directory"
du -sh .

echo ""
echo "[5] Create a mount point and mont look device (test)"

#create test file if not exists
if [ ! -f /tmp/test-disk.img ]; then
	echo "Creating test disk image 50mg"
	dd if=/dev/zero of=/tmp/test-disk.img bs=1M count=50 status=progress
	sudo mkfs.ext4 /tmp/test-disk.img
fi

#create mount point
sudo mkdir -p /mnt/testmount

#mount the loop device
sudo mount -o loop /tmp/test-disk.img /mnt/testmount

echo "mounted /tmp/test-disk.img to /mnt/testmount"

echo ""
echo "[6] Show mounted file systems"
mount | grep testmount

echo ""
echo "[7] Unmount test device "
sudo umount /mnt/testmount
echo "unmounted /mnt/testmount"

echo ""
echo "[8] OPTIONAL mount real partition (e.g. /dev/sdb1 to /backups)"
if [ -b /dev/sdb1 ]; then
	echo "device /dev/sdb1 exists"
	if mount | grep -q "/dev/sdb1 on /backups"; then
		echo "/dev/sdb1 is already mounted on /backups - skipping"
	else
		sudo mkdir -p /backups
		sudo mount /dev/sdb1 /backups
		echo "mounted /dev/sdb1 to /backups"
	fi

echo ""
echo "to make it permanent add this to /etc/fstab"
echo "/dev/sdb1	/backups	ext4	defaults	0	0"
else
	echo "/dev/sdb1 not fond - skipping real disc mount"
fi




