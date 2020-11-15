#!/usr/bin/bash

proc=$1 

if [[ $proc > 0 ]];then
	./lanciaricorsivo.55.sh $(( $proc - 1 )) & echo $!;
	wait $!
fi;	
