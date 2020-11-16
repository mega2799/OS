#!/usr/bin/bash

var=$PATH

while [[ -n  $var ]];do
	sep=${var%%:*}
	var=${var#*:}
	echo -e "$sep\n" 
	slash=$sep
	while [[ -n $slash ]];do
		bac=${slash%%/*}
		echo $bac
		slash=${bac#*/}
	done;
	if [[ $sep == $var ]];then 
		exit 0;
	fi;
done;
