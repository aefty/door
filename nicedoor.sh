#!/bin/bash

### BEGIN INIT INFO
# Provides:          aryan.eftekhari@gmail.com
# Description:       dovecot pop & imap daemon
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
do_start()
{
  sudo rm -rf $DIR
  sudo mkdir -p $DIR
  cd /$DIR
  echo "Retriving Repo ..."
  sudo git clone https://github.com/$USER/$REPO.git
  echo "Starting Boot Script..."
  sudo sh /$DIR/$TARGET
}
case $1 in
  start)
    do_start
    ;;
  *)
    echo "Usage: [poinat-startup-script] [start]"
    exit 3
    ;;
esac