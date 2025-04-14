#!/bin/bash

#DAILY SYSTEM BACKUP SCRIPT

#directories to back up
SRC_DIRS="/home/$USER/Linux-Labs"

#backup destination
DEST_DIR="/home/$USER/backup"

#create backup file name with date
DATE=$(date +%y-%m-%d-%H-%M-%S)
BACKUP_FILE="daily_backup_$DATE.tar.gz"

#full path to backup file 
BACKUP_PATH="$DEST_DIR/$BACKUP_FILE"

#log file
LOG_FILE="$DEST_DIR/backup.log"

echo "BACKUP STARTED AT $DATE"
echo "Source $SRC_DIRS"
echo "Destination $BACKUP_PATH"


#create destination directory if doesnt exist
mkdir -p "$DEST_DIR"

#create backup archive
tar -czf "$BACKUP_PATH" $SRC_DIRS 2>/dev/null

# check result and log
if [ $? -eq 0 ]; then
	echo "[$DATE] Backup successful: $BACKUP_FILE" >> "$LOG_FILE"
	echo "BACKUP compleated successfully."
fi	

#keep only the 3 most recent backups
cd "$DEST_DIR"
ls -t daily_backup_*.tar.gz | sed -e '1,3d' | xargs -d '\n' rm -f

echo "DONE"



