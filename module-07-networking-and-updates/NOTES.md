# 📝 Module 7 – My Notes

This module was a long one (like 10+ hours worth of stuff), so I split it into separate scripts to stay organized. Lots of networking, servers, and system maintenance. Here's what I learned and noticed along the way:

---

## 01 – Networking Basics

- `ip a` and `ip r` are newer and better than `ifconfig` and `route`
- `ss` works like `netstat` but it's faster and more modern
- `tcpdump -D` lists all interfaces, useful if sniffing
- DNS info is in `/etc/resolv.conf`
- `/etc/hosts` shows local mappings, can override DNS

---

## 02 – NIC Tools & Bonding

- `ethtool` shows interface speed, duplex mode, link status
- `ethtool -k` lists offloading features (TSO, LRO etc.)
- `nmcli device status` is super handy to quickly see if NICs are up
- Bonding not configured by default, but `/proc/net/bonding/` is where info goes if it is
- Used `modprobe --dry-run` to simulate loading bonding module

---

## 03 – File Transfer

- `wget` and `curl` both download files; curl is better for APIs
- `scp` is for quick file copy over SSH (easy to remember)
- `rsync` is more efficient for syncing folders (great for backups)
- `ftp` is outdated but good to know it exists for legacy systems

---

## 04 – Package Management

- `yum install` / `yum remove` = standard stuff
- `yum info` shows version, repo, description
- `rpm -qa | grep name` is quick to check if a package is installed
- `yum history` is useful to see what got installed/removed recently
- `yum update --assumeno` simulates updates without actually installing anything (safe!)

---

## 05 – SSH, Telnet, DNS

- `systemctl status sshd` to make sure SSH server is running
- Telnet is not used anymore, but can help test open ports (like `telnet google.com 80`)
- `nslookup`, `dig`, and `host` all check DNS in slightly different ways
- `dig -x IP` does reverse DNS (IP → domain)

---

## 06 – Time Sync

- `timedatectl` shows time, time zone, and NTP status
- `chronyd` is the default service in CentOS 8+ (replaces ntpd)
- `chronyc tracking` shows drift and sync info
- `ntpdate -q pool.ntp.org` tests connection to NTP servers (needs package installed)
- `/etc/chrony.conf` is the config file for chronyd

---

## 07 – Apache & Sendmail

- Installed Apache with `yum install httpd`, served HTML from `/var/www/html`
- Created a basic `index.html` with `echo`
- Port 80 should be open if Apache is running (checked with `ss -tuln`)
- Installed `sendmail` and sent test email to local root user (shows in `/var/mail/root`)
- Used `mailx` to read mail (had to install it)

---

## 08 – Logging & Security

- `rsyslog` is the default logging daemon; logs are in `/var/log/`
- `/var/log/messages` and `/var/log/secure` are the big ones
- `lastb` shows failed logins (needs root)
- `grep PermitRootLogin /etc/ssh/sshd_config` checks if SSH root login is allowed
- `ls -l /etc/shadow` confirms file permissions (should be 000 or 400)
- `firewalld` was active – checked with `systemctl is-active firewalld`
- `auditctl` is part of auditd (wasn’t installed on my VM by default)

---

## ✅ Things I found useful or interesting

- `--no-pager` on `systemctl` and `journalctl` is super useful for scripts (shows all output without opening `less`)
- Using `command -v <tool> || echo "not found"` is a great way to check if something's installed
- I should probably remember to run these scripts with `sudo` or check for root inside the script

---

That’s it for Module 7 — definitely the most intense so far. But honestly, now networking and services feel way less scary 😎
