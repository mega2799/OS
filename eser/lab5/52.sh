#!/usr/bin/bash

read num;
while (( $num > 0 ));do
	sleep 1;
	echo -n ". ${PPID}";
	num=$(( $num - 1 ));
done;
# to send te process in background use ctrl + z  

# to take it bacj in foreground use fg $PID 
