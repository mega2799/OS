#!/usr/bin/bash

read num;
while (( $num > 0 ));do
	sleep 1;
	echo -n ". ${PPID}";
	num=$(( $num - 1 ));
done;
