# 📝 Module 6 – Shell Scripting – Notes

Started with `scripting-lab.sh`.  
Checked current shell with `$SHELL` and `ps -p $$`, also grabbed kernel version using `uname -r` and `uname -a`.

Set up a basic `echo` script using a variable – just to see if it prints correctly. That part was simple.

The `if-then` block was next. Compared a number entered by the user. Worked fine once I remembered to leave spaces around the `[ ]` condition – Bash is picky about that.

Played around with loops:  
- `for` loop counted from 1 to 5  
- `while` loop incremented a counter  
- `until` loop did a countdown from 5  
No real issues there, just needed to be careful with increment syntax (`(( ))`).

Used `case` to simulate a menu-style interaction – start/stop/restart – nice way to see how Bash handles user input.

Created an alias (`ll='ls -l'`) and tested it – works fine in the current shell session. Not persistent, but good demo.

Finished up with checking command history (`history | tail -n 5`).

---

## Bonus: `module06-backup.sh` – simple backup automation

Wrote a separate script that creates a compressed archive of selected folders:
- `/home/dawid/Documents`
- `/home/dawid/Linux-Labs`

It saves backups in `/home/dawid/backup`, names them with a timestamp, and logs results to `backup.log`.  
It also keeps only the last 3 backups – older ones get deleted automatically.  
Really useful for practicing a basic real-life sysadmin task.

---

## Cron

Set up a daily cron job at 2:00 AM to run the backup script.  
Used `crontab -e` to add this line:

```cron
0 2 * * * /home/dawid/Linux-Labs/module-06-shell-scripting/module06-backup.sh
