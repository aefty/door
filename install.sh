#!/bin/sh
echo "Nicedoor Installtion ..."
echo $1

if [[ -z "$1" ]]; then
	echo ">> install.sh etc/init.d/<PATH-TO-RUN-SCRIPT-USING-DASHES-NOT-SLASHES@USERNAME.sh>"
	echo '\n'
else
	sudo cp ./nicedoor.sh $1
	sudo chmod 755 $1
	NAME=$(basename $1)

	sudo update-rc.d $NAME defaults
fi