#!/bin/bash

# Output of script to display disk usage
OUTPUT=$(df -h | awk '$5+0 > 80 {print 6}')

# Log todays date
LOGDATE=$(date -d today)

# what to do if there are no disks with over 80% usage
if [ -z "$OUTPUT" ]; then
    echo "$LOGDATE : All systems under 80%" >> /var/log/diskUsageAlerts

# and what do do if theere is
else
    echo "The following systems are running at 80% or over: "
    echo "$LOGDATE : $OUTPUT" >> /var/log/diskUsageAlerts

