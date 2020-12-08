#!/usr/bin/bash 

dir=/usr/include 

for names in `find $dir -mindepth 1 -type d `;do 
	name=${names:${#dir}+1} 
	echo $name
	if (( ${#name} >=8 )); then
	 	echo ${name:7:1} >> 8.txt 
	 fi
	 if (( ${#name} >= 7)); then
	 	echo ${name:6:1} >> 7.txt 
	 fi
done
