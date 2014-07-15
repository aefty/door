#!/bin/sh
echo "Nicedoor Installtion ..."
echo $1

if [[ -z "$1" ]]; then
	echo ">> install.sh <PATH-TO-RUN-SCRIPT-USING-DASHES-NOT-SLASHES@USERNAME.sh>"
	echo '\n'
else
	sudo cp ./nicedoor.sh /etc/init.d/$1
	sudo chmod 755 /etc/init.d/$1
	sudo update-rc.d $1 defaults
fi