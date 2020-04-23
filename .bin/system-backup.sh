#!/bin/bash
#backup_remote.sh
# Basic snapshot-style rsync full system backup script

/home/rob/.bin/rsync_backup.sh -i /home/rob/.ssh/id_rsa --log-dir /home/rob/docs/backup_logs/ / rob@bb:/data/backups/rob-pc/ /home/rob/docs/backup_exclude.txt


#
# OLD SCRIPT
#
# OPT="-aAXq"
# date=`date "+%F"`
# LINK="--link-dest=../latest"
# SRC="/"
# SNAP="blueberry:/data/backups/rob-pc/"
# LOCAL="/data/backups/rob-pc/"
# LAST="/data/backups/rob-pc/latest"
#
# if [ -d /media/blueberry/backups/rob-pc ]
# then
#         echo "blueberry already mounted"
# else
#         /home/rob/.bin/mnt-bb
# fi
#
# #rsync files via ssh
# sudo rsync $OPT \
# --include=/etc \
# --include=/home \
# --exclude={"/*","/home/rob/.cache/*","/home/rob/.android/*","/home/rob/.gradle/*","/home/rob/.local/share/Steam/",} \
# -e "ssh -i /home/rob/.ssh/id_rsa -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" $LINK $SRC ${SNAP}$date
#
# # Remove symlink to previous snapshot
# ssh root@192.168.2.21 "rm -f $LAST"
#
# # Create new symlink to latest snapshot for the next backup to hardlink
# ln -s /media/blueberry/backups/rob-pc/$date /media/blueberry/backups/rob-pc/latest
