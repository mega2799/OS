#!/usr/bin/bash

# scrivereunarigadicomandocheleggerighedastandardinputeperciascunadiquestemetteinoutputilnumerodicaratterichelacompongono.	

echo enter 1 to stop
while true;do	
	read a; echo ${#a};
	if [[ $a -eq 1 ]];then
		break;
	fi;
done;
