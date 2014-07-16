#!/bin/bash
echo "Door Installtion ..."

if [ -z "$1" ]; then
    echo ">> ./install.sh <path-to-startup-script@host.sh>"
    echo "\n"
else

    LOCATION=/etc/init.d
    echo "\n"
    echo "Attempting to install in path : "$LOCATION/$1
    echo "\n"

    sudo cp door.sh $LOCATION/$1
    sudo chmod 755 $LOCATION/$1
    NAME=$(basename $1)
    sudo update-rc.d $NAME defaults
    echo "Installation Done..."
    echo "Starting Script ..."
    sudo sh $LOCATION/$1

fi
