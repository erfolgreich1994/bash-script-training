#!/bin/bash 
# Dieses Skript prüft den Zustand der Services und 
# wenn ein besonderer Service ausgeschaltet wäre, 
# wäre automatisch eingeschaltet worden. Achten Sie 
# darauf, eine Nachricht per E-Mail abgeschickt yu werden, 
# wenn sich der Zustand eines Services ändert. 

# --------------------------------------------------------------------

liste1=("sshd" "apache2" "systemd-timesyncd.service" "postfix")

for service in ${liste1[@]}
do 
	echo "Service " $service " wird überprüft ..."
	systemctl is-active $service > /dev/null
	ergebnis=$(echo $?)
	if [ "$ergebnis" == "0" ]; then 
		echo  "Service " $service " ist eingeschaltet " >> /var/log/$(date +%Y_%m_%d).log
	else
		systemctl start $service > /dev/null
		echo  "Achtung! Service " $service " wurde von Skript eingeschaltet " >> /var/log/$(date +%Y_%m_%d).log
		echo  "Achtung! Service " $service " wurde von Skript eingeschaltet am  " $(date +%Y_%m_%d) | mail -s "Service am " $(date +%Y_%m_%d) extremedata1400@gmail.com
		

	fi
done

