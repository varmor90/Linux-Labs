# Module 8 – My Linux Notes (Disk, Storage, LAMP)

## Boot levels and system startup

- `systemctl get-default` helps check what mode the system starts in (multi-user, graphical, etc.)
- I used `ps -p 1 -o comm=` to confirm that systemd is running as PID 1

## Disks and partitions

- `lsblk` is really useful to see how disks and partitions are laid out
- Used `fdisk -l` to see full disk details
- For testing, I created a loop device using `dd` and `losetup` instead of using a real disk
- Mounted a real `/dev/sdb1` partition and it worked fine, but you have to be careful with `/etc/fstab` if you want it to persist across reboots

## LVM

- Created a basic LVM setup with `pvcreate`, `vgcreate`, `lvcreate`
- Checked everything with `lvdisplay`, `vgs`, and `lvs`
- Formatted the LV with `mkfs.ext4` and mounted it like a normal disk
- Overall, it's not as hard as I thought once you go through the commands in order

## Swap

- Created a swap volume using LVM
- Used `mkswap` and `swapon` to activate it
- It worked and showed up in `swapon --show`
- Didn’t add it to `/etc/fstab` yet, but that's how you'd make it permanent

## xfs and stratis

- Used `xfs_info` to view XFS file system details (block size, metadata, etc.)
- Stratis seems like a newer, simplified alternative to LVM — didn't test deeply because it needs multiple disks

## Software RAID

- Set up RAID 1 with `mdadm` using two loop devices
- Used `cat /proc/mdstat` to monitor status and rebuild process
- It actually worked better than I expected — could simulate real RAID easily

## Disk checking and backup

- Ran `fsck` on an ext4 loop device to check for errors
- Also tested `xfs_repair` for an XFS system
- Used `dd` to create a raw disk image as a backup — simple but a bit slow
- Added `status=progress` to `dd` to see the copy in real time

## NFS and Samba

- NFS was easy to configure with `/etc/exports` and worked right away on localhost
- Samba was a bit trickier, had to make sure `smb.conf` was correct and used proper mount options like `vers=2.1`
- Also had to create the test file manually, or the mount looked empty

## LAMP stack

- Installed Apache, PHP, and MariaDB with `dnf`
- Created a basic `index.php` with `phpinfo()` and verified it in the browser
- Apache and MariaDB services both worked after enabling
- Still need to run `mysql_secure_installation` for proper DB setup

## General thoughts

This was one of the most useful modules so far. I feel like I actually practiced things I might be asked to do in a junior sysadmin or DevOps job. Setting up storage, doing backups, building a basic web server — all of that is super practical. Took some effort but I understand it way better now.
