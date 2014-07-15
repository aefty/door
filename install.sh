#!/bin/sh
echo "Nicedoor Installtion ..."
echo $1

if [[ -z "$1" ]]; then

	echo ">> install.sh etc/init.d/<PATH-TO-RUN-SCRIPT-USING-DASHES-NOT-SLASHES@USERNAME.sh>"
	echo '\n'

else

	if [[ "$1"==$(basename $1) ]]; then
		PATH = "/etc/init.d/"$1
	else
		PATH = $1
	fi
	
	echo "\n"
	echo "Installed In: "$PATH
	echo "\n"

	sudo cp nicedoor.sh $PATH
	sudo chmod 755 $PATH
	NAME=$(basename $1)
	sudo update-rc.d $NAME defaults
fi