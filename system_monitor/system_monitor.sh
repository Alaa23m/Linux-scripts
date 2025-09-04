#!/bin/bash
# --------------------------------------------
# System Health Monitoring Script (Local Alerts)
# Author: Alaa Mohamed
# Description: Monitors CPU, RAM, and Disk usage.
# Sends local mail alert to the root mailbox if thresholds are exceeded.
# --------------------------------------------

# ==== Configuration ====
CPU_THRESHOLD=90
RAM_THRESHOLD=90
DISK_THRESHOLD=90

# Local admin mailbox (root by default)
ADMIN_EMAIL="root"
HOSTNAME=$(hostname)

# ==== Functions ====

send_alert() {
    local resource=$1
    local usage=$2
    echo "ALERT: $resource usage on $HOSTNAME is at ${usage}%." \
        | mail -s "System Alert: $resource usage on $HOSTNAME" "$ADMIN_EMAIL"
}

check_cpu() {
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
    cpu_usage=${cpu_usage%.*}
    if [ "$cpu_usage" -ge "$CPU_THRESHOLD" ]; then
        send_alert "CPU" "$cpu_usage"
    fi
}

check_ram() {
    ram_usage=$(free | awk '/Mem/ {printf("%.0f"), $3/$2 * 100.0}')
    if [ "$ram_usage" -ge "$RAM_THRESHOLD" ]; then
        send_alert "RAM" "$ram_usage"
    fi
}

check_disk() {
    disk_usage=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')
    if [ "$disk_usage" -ge "$DISK_THRESHOLD" ]; then
        send_alert "Disk" "$disk_usage"
    fi
}

# ==== Main ====
check_cpu
check_ram
check_disk
