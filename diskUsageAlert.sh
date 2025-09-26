#!/bin/bash

OUTPUT=$(df -h | awk '$5+0 > 80 {print 6}')

LOGDATE=$(date -d today)

if [ -z "$OUTPUT" ]; then
    echo "$LOGDATE : All systems under 80%" > /var/log/diskUsageAlerts

else
    echo "The following systems are running at 80% or over: "
    echo "$LOGDATE : $OUTPUT" >> /var/log/diskUsageAlerts

