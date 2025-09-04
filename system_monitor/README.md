#  System Health Monitoring Script

A Bash script for **proactive monitoring** of system resources.  
It checks **CPU**, **RAM**, and **Disk usage**, and sends a **local mail alert** to the system administrator (root mailbox) if usage exceeds defined thresholds.

---------------------------------

## Features
-  Monitor **CPU usage** with `top`
-  Monitor **RAM usage** with `free`
-  Monitor **Disk usage** with `df`
-  Configurable thresholds
-  Local mail alerts (stored in the root mailbox)
-  Can run manually, via **cron**, or as a **systemd timer**

------------------------------
## Installation & Usage

1. Clone Repository
2. Make Script Executable
3. Run Manually
----------------------------------
## Local Mail Alerts

This script uses the local mailbox on the system.
By default, alerts are sent to the root mailbox.

To read alerts:
mail

or specify another user:
ADMIN_EMAIL="username"
------------------------------
## Automation
 Cron (simple)

Run every 5 minutes:
crontab -e
Add:

*/5 * * * * /home/username/Linux-scripts/system-monitoring/system_monitor.sh
-------------------------------
## Requirements
Linux system (tested on RHEL/CentOS)

top, free, df, and mailx installed

Local mailbox enabled (default in RHEL/CentOS)

