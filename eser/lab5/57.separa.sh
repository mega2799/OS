#!/usr/bin/bash

var=$PATH

while [[ -n  $var ]];do
	sep=${var%%:*}
	var=${var#*:}
	echo "$sep : ${#sep}"  
	if [[ $sep == $var ]];then 
		exit 0;
	fi;
done;
