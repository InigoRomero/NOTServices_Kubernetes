#!/bin/sh

# with lftp:
# `set ssl:verify-certificate false`

[ -z "$FTP_USER" ] && FTP_USER=admin
[ -z "$FTP_PASSWORD" ] && FTP_PASSWORD=admin

adduser -D "$FTP_USER"
echo "$FTP_USER:$FTP_PASSWORD" | chpasswd
echo "user:password = $FTP_USER:$FTP_PASSWORD"

/usr/sbin/pure-ftpd -Y 2 -p 15477:15477 -P localhost
