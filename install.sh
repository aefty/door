#!/bin/bash
echo "Nicedoor Installtion ..."

if [ -z "$1" ]; then
  echo ">> install.sh etc/init.d/<PATH-TO-RUN-SCRIPT-USING-DASHES-NOT-SLASHES@USERNAME.sh>"
  echo "\n"
else
  if [ "$1"==$(basename $1) ]; then
    P="/etc/init.d/"$1
  else
    P=$1
  fi
  
  echo "\n"
  echo "Installed In: "$P
  echo "\n"

  sudo cp nd.sh $P
  sudo chmod 755 $P
  NAME=$(basename $1)
  sudo update-rc.d $NAME defaults
fi
