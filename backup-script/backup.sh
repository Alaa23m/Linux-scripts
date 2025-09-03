#!/bin/bash
# --------------------------------------------
# Backup Script
# Author: Alaa Mohamed
# Description: This script creates a compressed
# backup of specific directories with today's date.
# --------------------------------------------

# Directories to backup (edit this list as needed)
SOURCE_DIRS=("/etc" "/var/log")

# Destination folder for backups
BACKUP_DIR="/home/$USER/backups"

# Create destination directory if not exists
mkdir -p "$BACKUP_DIR"

# Backup filename with date
DATE=$(date +"%Y-%m-%d")
BACKUP_FILE="$BACKUP_DIR/backup_$DATE.tar.gz"

# Create the backup
echo "Starting backup..."
tar -czf "$BACKUP_FILE" "${SOURCE_DIRS[@]}"

# Check if backup succeeded
if [ $? -eq 0 ]; then
    echo "Backup completed successfully!"
    echo "File saved to: $BACKUP_FILE"
else
    echo "Backup failed!"
    exit 1
fi
