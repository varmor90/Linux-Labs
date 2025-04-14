# Module 6 – Shell Scripting

## 🧠 Topics Covered

- Linux Kernel basics
- What is a Shell?
- Types of Shells (bash, sh, zsh, etc.)
- Shell scripting structure
- Writing basic shell scripts
- If-then control structures
- For loops
- While / Until loops
- Case statements
- Shell Aliases
- Shell History
- Command History tools

---

## 🧪 Lab Scripts

Main script file: `scripting-lab.sh`
## 📦 Bonus Script: System Backup

- Script: `backup.sh`
- Function: Creates a compressed backup of a specified directory with timestamp and logs the result.
## 🕒 Automation: Daily Backup via Cron

- **Cron Job Configured**: The backup script is set to run automatically **every day at 2:00 AM**.
- **Cron line** (added via `crontab -e`):

```cron
0 2 * * * /home/Dawid/Linux-Labs/module-06-shell-scripting/module06-backup.sh

---

## ✅ Lab Tasks Summary

Identify the shell in use
Display kernel version
Create and run a basic shell script
 Use if-then conditions
Write a for loop
Use while / until loops
Create a case statement
Define and use aliases
Explore shell history and search past commands
BONUS: Create and test a backup automation script
