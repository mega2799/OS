#!/usr/bin/bash
if [[ -e out.txt ]];then rm -f out.txt; fi 
tot=0
i=0
for (( ; $i<10 ; i= $i +1 )) ; do
	num=$( ./random09.sh )
	echo $num >> out.txt
	tot=$(( tot + $num )) 
done 
echo sum= $tot 
