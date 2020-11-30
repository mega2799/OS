#!/usr/bin/bash

exec {FD}< ${1}
exec {FD2}< ${2} 

i=1
while read -u ${FD} line1 ;do
	while read -u ${FD2} line2;do 
		if $(( i % 2 == 0));then
			echo $line1
			echo $line2
		else
			echo $line2
			echo $line1
		fi;
		i=$(( $i +1 ))
	done;
done;		
exec {FD}<&- 
exec {FD2}<&- 

