#!/usr/bin/bash

num=$1
while (( $num > 0 ));do
	sleep 1;
	echo -n ". ${PPID}";
	num=$(( $num - 1 ));
done;
