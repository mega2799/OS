#!/usr/bin/bash

path=/usr/include/
for name in `ls ${path}`;do
	if [[ -d $path$name && -r $path$name && $path$name -nt ${path}stdio.h ]];
	then
		echo $path$name
	fi
done

