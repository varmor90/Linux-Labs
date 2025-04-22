#!/bin/bash


#REQUIRE ROOT
if [ "$EUID" -ne 0 ]; then
	echo "please run this script as root"
	exit 1
fi


echo "MODULE 8 -09 NFS and SAMBA Sharing (Local Demo)"

echo ""
echo "[1] Installing NFS and Samba tools"
dnf install -y nfs-utils samba samba-client cifs-utils &>/dev/null


echo ""
echo "[2] Creating shared directories"
mkdir -p /srv/nfs_share
mkdir -p /srv/samba_share
chmod 777 /srv/nfs_share /srv/samba_share

echo ""
echo "[3] Adding test file to both shares"
echo "this is NFS share" > /srv/nfs_share/nfs.txt
echo "this is Samba share" > /srv/samba_share/samba.txt

echo ""
echo "[4] exporting NFS share"
echo "/srv/nfs_share 127.0.0.1(rw,no_root_squash)" > /etc/exports
exportfs -ra
systemctl enable --now nfs-server &>/dev/null


echo ""
echo "[5] Mounting NFS share Locally"
mkdir -p /mnt/nfs_client
mount -t nfs 127.0.0.1:/srv/nfs_share /mnt/nfs_client
cat /mnt/nfs_client/nfs.txt

echo ""
echo "[6] Setting up minimal samba config"
cp /etc/samba/smb.conf /etc/samba/smb.conf.bak
echo "
[global]
	workgroup = WORKGROUP
	security = user
	map to guest = Bad User

[samba]
	path = /srv/samba/share
	browsable = yes
	writable = yes
	read only = no" > /etc/samba/smb.conf
systemctl enable --now smb &>/dev/null

echo ""
echo "[7] Mounting samba share locally "

mkdir -p /mnt/samba_client
mount -t cifs //122.0.0.1/samba /mnt/samba_client -o username=guest,password=,vers=2.1
cat /mnt/samba_client/samba.txt

echo ""
echo "Both Shares mounted locally"
df -h | grep mnt

echo ""
echo "DONE"


