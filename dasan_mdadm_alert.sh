# Copyright by Dasandata.co.ltd
# http://www.dasandata.co.kr
# CentOS 7.x

# Import dasan_export_global_variable.sh
source /usr/local/sbin/dasan_export_global_variable.sh

TITLE='mdadm_Email_Alert_by_'$TITLE_TAIL
LOG='/tmp/dasan_mdadm_alert.log'

# Detect Status of mdadm

MD_NAME=(`cat /proc/mdstat | grep ^md | awk '{print $1}'`)
MD_STATUS=(`cat /proc/mdstat | grep active | awk '{print $3}' | uniq | wc -l`)

if [ ${MD_STATUS} -gt 1 ]

then echo "
Warinig!!

$TITLE_TAIL
Soft RAID is Not ACTIVE.

Check Disk Status!!
" >> $LOG

echo "##### cat /proc/mdstat" >> $LOG
cat /proc/mdstat >> $LOG
echo "" >> $LOG

for VALUE in "${MD_NAME[@]}";
do echo "##### mdadm --detail /dev/$VALUE " >> $LOG
mdadm --detail /dev/$VALUE >> $LOG
echo "#####
" >> $LOG ; done

cat $LOG | /usr/bin/mail -s $TITLE $ADMIN_LOG_EMAIL
rm $LOG

else echo "mdadm check ok."

fi

# end.
