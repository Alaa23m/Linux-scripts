#Backup Script (Linux - Bash)

This project demonstrates a **simple backup script** using Bash.  
It compresses specific directories into a `.tar.gz` file with the current date in the filename.

--------------

#Features
- Uses basic **Bash scripting** concepts.
- Creates compressed archives with **tar** and **gzip**.
- Organizes backups into a dedicated folder.
- Can be scheduled with **cron jobs** for automation.

-----------------
Customization

Edit the SOURCE_DIRS array inside backup.sh to include the folders you want to back up.

Change BACKUP_DIR if you want backups saved in another location.
--------------------------------
Automation with Cron

You can schedule automatic backups with cron:

Open the cron editor:

crontab -e


Add this line to run the backup every day at midnight:

0 0 * * * /home/username/backup-script/backup.sh
---------------------------------------------------------
Requirements

Linux (Tested on Red Hat & CentOS)
Bash
tar and gzip commands available
