#!/bin/bash
# Copyright (c) 2019 by Dasandata Corp. http://www.dasandata.co.kr
# Tested on CentOS7.X
# This File Locate is /usr/local/sbin/rsync_nfs_backup.sh

# run as a root
ROOT_UID=0

if [ "$UID" != "$ROOT_UID" ]; then
  echo "Must be a root to run this script."
  exit 1
fi

# source dasan_export_global_variable or define ADMIN_LOG_EMAIL Address & TITLE_TAIL
ADMIN_LOG_EMAIL='xxue123@gmail.com'   # Separated by ","
TITLE_TAIL=dasan-document-server
#source /usr/local/sbin/dasan_export_global_variable.sh

# define SOURCE and TARGET / nfs path and target
BACKUP_SOURCE="/home/data/"
BACKUP_TARGET="/mnt/nas/data/"
NFS_TARGET="/mnt/nas"
NFS_SERVER="192.168.0.5:/file/99_temp"

# define LOG PATH
LOG_FULL='/var/log/dasan_rsync_backup.log'
LOG_TEMP='/var/log/dasan_rsync_temp.log'

# Function of Send email due to nfs connection failure.
send_error_mail() {
local TITLE='Fail_Rsync_by_'${TITLE_TAIL}
echo "
##################################################
# This Message from ${TITLE_TAIL}
# Using crontab (/etc/crontab)
# The location of the configuration file is below.
# /usr/local/sbin/dasan_export_global_variable.sh,
# /usr/local/sbin/rsync_nfs_backup.sh
##################################################
" >> ${LOG_FULL}
echo "##### Backup Failed..."         >> $LOG_FULL
echo $(date '+%Y-%m-%d %a %H:%M:%S')  >> $LOG_FULL
echo "
Failed Rsync Backup by nfs not connection.
Check Server Status and Configuration.
" >> ${LOG_FULL}
echo "### df -hT | grep -v tmpfs >> $LOG_FULL" >> $LOG_FULL
      df -hT | grep -v tmpfs >> $LOG_FULL  ;  echo "" >>  $LOG_FULL

cat ${LOG_FULL} | /usr/bin/mail  -s ${TITLE}  ${ADMIN_LOG_EMAIL}
rm ${LOG_FULL}
}

# Function of RSYNC Process and Send email of Succes Log
RSYNC_Process() {
local TITLE='Rsync_Backup_log_by_'${TITLE_TAIL}
echo  "
##################################################
# This Message from ${TITLE_TAIL}
# Using crontab (/etc/crontab)
# The location of the configuration file is below.
# /usr/local/sbin/dasan_export_global_variable.sh,
# /usr/local/sbin/rsync_nfs_backup.sh
##################################################
" >> ${LOG_FULL}

echo "##### Backup Start..."            >> $LOG_FULL
echo $(date '+%Y-%m-%d %a %H:%M:%S')  >> $LOG_FULL ; echo ""  >> $LOG_FULL

echo "### rsync -avzh  $BACKUP_SOURCE  $BACKUP_TARGET >> $LOG_TEMP 2>&1"  >> $LOG_FULL
      rsync -avzh  $BACKUP_SOURCE  $BACKUP_TARGET >> $LOG_TEMP 2>&1
echo "### head -10 $LOG_TEMP  >>  $LOG_FULL" >> $LOG_FULL
      head -10 $LOG_TEMP  >>  $LOG_FULL  ;  echo "" >>  $LOG_FULL
echo "### tail -10 $LOG_TEMP  >>  $LOG_FULL" >> $LOG_FULL
      tail -10 $LOG_TEMP  >>  $LOG_FULL  ;  echo "" >>  $LOG_FULL

echo "### du -h -d 1 ${BACKUP_TARGET}  >> $LOG_FULL" >> $LOG_FULL
      du -h -d 1 ${BACKUP_TARGET}  >> $LOG_FULL ; echo "" >>  $LOG_FULL

echo "### df -hT | grep -v tmpfs >> $LOG_FULL" >> $LOG_FULL
      df -hT | grep -v tmpfs >> $LOG_FULL  ;  echo "" >>  $LOG_FULL

echo $(date '+%Y-%m-%d %a %H:%M:%S')  >>  $LOG_FULL
echo "##### Backup End!"  >> $LOG_FULL

# email Send
cat ${LOG_FULL} | /usr/bin/mail  -s ${TITLE}  ${ADMIN_LOG_EMAIL}
rm ${LOG_FULL}
rm ${LOG_TEMP}

}

##### Running Job #####
# check nfs mount status
# If nfs-statsu error, trying to re-mount nfs.
# When nfs connection is successful, starting rsync backup Process
# But when nfs-statsu still fail, sending to error mail.

df | grep ${NFS_TARGET}
NFS_STATUS1=${?}
# nfs status fail is code = 1 or success code = 0
# echo ${NFS_STATUS1}
if [ ${NFS_STATUS1} -eq 1 ]; then
  mount -t nfs  ${NFS_SERVER}  ${NFS_TARGET}
  # re-check nfs mount
  df | grep ${NFS_TARGET}
  NFS_STATUS2=${?}
  # if error remount nfs to ERROR Mail
  if [ ${NFS_STATUS2} -eq 1 ]; then
    send_error_mail
    echo "Error nfs mount"
    exit 1
  else
    RSYNC_Process
    exit 1
  fi
else
  RSYNC_Process
  exit 1
fi

# End file.
