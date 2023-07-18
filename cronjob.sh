#!/bin/bash

# We set up a cronjob that uruns a backup to home directory.
# This is done to eliminate toil

source_path="/etc/nginx"
back_directory="$HOME/nginx_backup"

# Make directory if it doesn't exist
mkdir -p "$back_directory"

# Back up to the Nginx folder to the destination directory
rsync -avz $back_directory

# print a success message
echo "Nginx folder backup completed at $(date)" >> $HOME/nginx_backup.log

## schedule cron job
cron_schedule="0 0 * * *" ##run backup by 12:00am.

## Add the schedule to the crontab
(crontab -l 2>/dev/null; echo "$cron_schedule $HOME/nginx_back.sh") | crontab -