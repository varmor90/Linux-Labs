# Module 9 – My Troubleshooting & Hardening Notes

## umask

- `umask` defines the default permissions for newly created files/directories
- Default on my system was `002`, meaning files get 664 and directories 775
- Changing `umask` to `077` resulted in very restricted access (files: 600, dirs: 700)
- Temporary changes work fine, but to make it permanent I’d have to add it to `.bashrc` or `/etc/profile`

## SELinux

- `getenforce` gives the current status (Enforcing, Permissive, Disabled)
- `setenforce 0` changes it to Permissive temporarily, but resets on reboot
- Config file is at `/etc/selinux/config` where you can set it permanently
- Useful to know how to switch modes quickly if something breaks in production

## Permission denied when using cd

- I created a directory with `chmod 600` and couldn’t cd into it – expected
- Fixed it by adding `x` permission: `chmod u+x dir`
- Important reminder: directories need execute permission to be accessible

## Removing unused packages

- Used `dnf autoremove` to get rid of dependencies that are no longer needed
- Also tested `dnf repoquery --extras` to see manually installed or orphaned packages
- Helps keep the system clean and lighter, good habit especially for containers

## Network troubleshooting

- Had IP assigned, but `ping` failed
- Checked with `ip addr` and `ip route` – interface and gateway were fine
- DNS checked with `/etc/resolv.conf` and `ping google.com`
- Also verified firewall (`firewalld`) status and tested with `ss -tuln`
- This is probably the most realistic issue to hit on real servers, and good to know how to break it down

## Overall thoughts

This module felt different – more real-world, less theory. I liked that I had to think through problems and not just run one-liners. Everything here is useful in practice, especially the network and permission stuff. Feels like proper sysadmin/DevOps training.
