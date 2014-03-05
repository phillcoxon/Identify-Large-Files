#!/bin/bash

# Identifies any files over specified size and sends an email to the notafication email address
#
# Set up a cron as follows:
#
# 0 3 * * * /root/scripts/identify_large_files.sh

## Hostname
HOSTNAME=`hostname`

DATE=`date +%F`

## Files over this size are tracked
FILESIZE=5000k
HUMANSIZE=5Mb

##Notification email address
EMAIL=your.email@example.com

SUBJECT="Large files (> ${HUMANSIZE}) in /home/ for ${HOSTNAME} on ${DATE}"

#EXAMPLE=/var/log/backuplogs/backup.err`date +%F`

find /home -type f -size +${FILESIZE} -exec ls -lh {} \; | awk '{ print $5 ": " $9 }' | sort -nr | mail -s"${SUBJECT}" ${EMAIL}
