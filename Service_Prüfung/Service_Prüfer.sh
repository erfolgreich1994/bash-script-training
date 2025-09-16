#!/bin/bash 

# Definitin ein Array zum Prüfung des Zustands

services=("apache2" "postgresql")

# Prüfung eines Services mittels einer Schlange

for x in ${services[@]}
do
	systemctl is-active $x > /dev/null
	
	Ausgabe=$(echo $?)
	
	if [ "$Ausgabe" ==  "0" ] ; then
		echo "Service " $x ist eingeschaltet...
	else
		echo "Service " $x ist ausgeschltet ...
	fi
done


