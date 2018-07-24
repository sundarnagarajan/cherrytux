#!/bin/bash
# Script to extract a bunch of files into a gzipped-tar file
# $1: Remote user@hostname to use with SSH
# $2: Remote location to EXTRACT TGZ file using 'ssh $1 tar -C $2 zxvf -'

if [ -z "$2" ]; then
    echo "$(basename $0) <user_host> <remote_dir>"
    echo "<user_host>: Remote user@hostname to use with SSH"
    echo "<remote_dir>: Remote location to EXTRACT TGZ file using 'ssh $1 tar -C $2 -xvf -'"
    exit 1
fi

USER_HOST="$1"
REMOTE_DIR="$2"


FILES="/etc/os-release /etc/issue /etc/issue.net /etc/lsb-release /usr/lib/os-release /usr/share/base-files/motd /etc/apt/sources.list /etc/dpkg/origins/* /cdrom/.disk/info /cdrom/ubuntu /etc/pop-os"

PRESEED_FILE=$(cat /proc/cmdline | while read l; do for a in $l; do pfx=$(echo "$a" | cut -d= -f1); if [ "$pfx" = "file" ]; then echo "$a" | cut -d= -f2; fi; done; done)
if [ -n "$PRESEED_FILE" ]; then
    FILES="$FILES $PRESEED_FILE"
else
    echo "PRESEED_FILE not found"
fi

tar -cjf - $FILES 2>/dev/null | ssh $USER_HOST tar -C "$REMOTE_DIR" -xvjf -
