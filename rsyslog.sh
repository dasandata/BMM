

# Configure SMS to receive messages and reload rsyslog configuration
perl -pi -e "s/\\#\\\$ModLoad imudp/\\\$ModLoad imudp/"       /etc/rsyslog.conf
perl -pi -e "s/\\#\\\$UDPServerRun 514/\\\$UDPServerRun 514/" /etc/rsyslog.conf
systemctl restart rsyslog

# Define compute node forwarding destination
echo "*.* @${sms_ip}:514"       >>     $CHROOT/etc/rsyslog.conf

# Disable most local logging on computes. Emergency and boot logs will remain on the compute nodes
perl -pi -e "s/^\*\.info/\\#\*\.info/" $CHROOT/etc/rsyslog.conf
perl -pi -e "s/^authpriv/\\#authpriv/" $CHROOT/etc/rsyslog.conf
perl -pi -e "s/^mail/\\#mail/"         $CHROOT/etc/rsyslog.conf
perl -pi -e "s/^cron/\\#cron/"         $CHROOT/etc/rsyslog.conf
perl -pi -e "s/^uucp/\\#uucp/"         $CHROOT/etc/rsyslog.conf


# ignore-systemd-session-slice
cat << EOF > /etc/rsyslog.d/ignore-systemd-session-slice.conf
if \$programname == "systemd" and \
(\$msg contains "Starting Session" or \
\$msg contains "Started Session" or \
\$msg contains "Created slice" or \
\$msg contains "Starting user-" or \
\$msg contains "Starting User Slice of" or \
\$msg contains "Removed session" or \
\$msg contains "Removed slice User Slice of" or \
\$msg contains "Stopping User Slice of") \
then stop
EOF

# log rotate
### /etc/logrotate.d/secure /  one log by weekly, max 6month
/var/log/secure {
        weekly
        create 0600 root root
        rotate 24
}

### /etc/logrotate.d/syslog
/var/log/cron
/var/log/maillog
/var/log/messages
#/var/log/secure
/var/log/spooler
{
    missingok
    sharedscripts
    postrotate
        /bin/kill -HUP `cat /var/run/syslogd.pid 2> /dev/null` 2> /dev/null || true
    endscript
}
