#!/usr/bin/bash

exec {FD}< $1 
while read -u ${FD}	riga;do
	if [[ `echo $riga | grep "A"` ]];then
		echo $riga | wc -c
	fi;
done;
exec {FD}<&- 
