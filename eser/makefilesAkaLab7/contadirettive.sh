#!/usr/bin/bash 

dir=/usr/include 

cnt=0
for names in `find $dir -type f | sort | uniq -u`;do 
	line=0
	while read riga;do 
		if (( `cat $riga | sort | uniq -u | grep "#"` ));then 
			line=$(( line + 1 )) 
		fi 
	done < names 
	cnt=$(( cnt + line + 1)) 
done; 

echo $cnt 
