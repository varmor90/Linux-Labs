# Module 8 – Disk Management, Storage & Runlevels

## 🧠 Topics Covered

- Linux Boot Process and Runlevels
- Mounting and Partitioning (fdisk, lsblk, mount)
- Logical Volume Management (LVM)
- xfs filesystem and `xfs_info`
- RAID 1 Software RAID using `mdadm`
- Disk checks and backup with `fsck`, `xfs_repair`, `dd`
- NFS and Samba network shares
- LAMP Stack (Apache + PHP + MariaDB) setup

---

## 🧪 Lab Scripts

- `01_boot_levels.sh` – check boot level, init, systemd
- `02_motd.sh` – customize Message of the Day
- `03_disk_partitions.sh` – mount loop disk, real partition, `lsblk`, `fdisk`
- `04_lvm_setup.sh` – create LVM from scratch (PV, VG, LV)
- `05_lvm_extend_swap.sh` – create a SWAP LV and activate it
- `06_xfs_stratis.sh` – use `xfs_info`, intro to Stratis
- `07_raid.sh` – simulate RAID 1 with `mdadm` and loop files
- `08_fsck_backup.sh` – test `fsck`, make backup with `dd`
- `09_nfs_samba.sh` – create local NFS and Samba shares
- `10_lamp_mysql.sh` – install full LAMP stack on CentOS

---

## ✅ Tasks Summary

- [x] Created test disks and mounted manually
- [x] Configured loop devices and real partitions
- [x] Created full LVM with mounting and file writing
- [x] Created SWAP with LVM and verified it
- [x] Simulated RAID 1 and verified data replication
- [x] Tested file system checking tools and `dd` backups
- [x] Shared folders over NFS and Samba
- [x] Installed and tested LAMP stack (Apache, PHP, MariaDB)

---
