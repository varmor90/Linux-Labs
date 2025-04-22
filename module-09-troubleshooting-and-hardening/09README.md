# 🛠️ Module 9 – Troubleshooting & System Hardening

## 📚 Topics Covered

- 🔐 Default file permission mask (`umask`)
- 🛡️ SELinux modes and config
- 🚫 Permission issues with directories (`cd`)
- 🧹 Removing orphaned or unused packages
- 🌐 Diagnosing network issues (IP assigned, but no connection)

---

## 🧪 Lab Scripts

| Script | Description |
|--------|-------------|
| `01_umask.sh` | 🔐 Check and change default permissions using `umask` |
| `02_selinux_status.sh` | 🛡️ View SELinux status and switch modes (Enforcing/Permissive) |
| `04_fix_cd_issue.sh` | 🚫 Simulate and fix "permission denied" when `cd` fails |
| `05_orphan_packages.sh` | 🧹 Clean up unneeded packages with `dnf autoremove` |
| `06_network_not_reachable.sh` | 🌐 Troubleshoot network when IP is set but there's no connection |

---

## ✅ Tasks Completed

- [x] Tested different `umask` values and observed their effect on file creation
- [x] Checked and modified SELinux mode using `getenforce` and `setenforce`
- [x] Reproduced a broken directory access issue and fixed it with proper permissions
- [x] Identified and removed orphan packages from the system
- [x] Diagnosed a network issue using `ip`, `ping`, `firewalld`, and DNS tools

---

## 🧠 Skills Practiced

- System-level troubleshooting (permissions, SELinux, package cleanup)
- Basic network diagnosis (routing, DNS, interface status)
- Working with core RHEL/CentOS tools in a DevOps context
- Clean, reproducible scripting for common real-world problems

---

> 💡 These troubleshooting cases reflect real-world issues that junior sysadmins or DevOps engineers regularly face. This lab was designed to practice debugging workflows and system health checks on CentOS-based systems.
