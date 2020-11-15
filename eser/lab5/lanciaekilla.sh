#!/usr/bin/bash

output=`./lanciaEPrendi.sh 5`

echo  "this processes gonna die sooon muahaha "
for pid in $output;do
	echo "$pid any last word ?"
	kill -9 $pid;
	echo "" 
	echo "headshotted muahahah" 
done;
