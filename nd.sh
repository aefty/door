#!/bin/bash

### BEGIN INIT INFO
# Provides:          scriptname
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Start backdoor script that will check github for updates on startup.
# Description:       The executed startup script is located in File Name: <PROJECT-BOOT-STARTUP@USERNAME.sh> Location: <github.com/USERNAME/PROJECT/BOOT/STARTUP.sh> 
### END INIT INFO

DIR=/www
FILE=$(basename $0 .sh)
F=$(echo $FILE|sed "s/\-/\//g")
USER=$(echo $F|cut -d "@" -f 2)
TARGET=$(echo $F|cut -d "@" -f 1).sh
REPO=$( echo $TARGET|cut -d "/" -f 1) 
echo "\n"
echo "Target Repository: <"https://github.com/$USER/$REPO.git">"
echo "Target Boot File: <"$DIR/$TARGET">"
echo "\n"

sudo rm -rf $DIR
sudo mkdir -p $DIR
cd /$DIR
echo "Retrieving Repository ..."
sudo git clone https://github.com/$USER/$REPO.git
echo "Starting Boot Script..."
sudo sh /$DIR/$TARGET
echo "Script Ended..."