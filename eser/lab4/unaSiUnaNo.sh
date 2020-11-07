#!/bin/bash

# UNA SI UNA NO script

COUNT=1
while read line;do
	if (( $COUNT == 0 ));then
		COUNT=1
	else
		echo $line;
		COUNT=0
	fi;
done ;
