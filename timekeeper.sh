#############################################################
# ntpdate.cron
# A daily cron script for setting the date and time via NTP
#############################################
#!/bin/sh

#server="timekeeper.isi.edu"
server="192.168.0.117"

/usr/sbin/ntpdate $server
/sbin/hwclock --systohc
