#!/usr/bin/bash

num=0
exec {FD}<define.h 
while read -u ${FD} a b c;do
	num=$c
done;
exec {FD}<&-

i=0
while (( ${i} != num + 1 )) ;do
	echo "extern unsigned int var${i};" >> variabiliGlobali.h;
	i=$(( $i + 1 ))
done; 

echo "extern int conta(void);" >> variabiliGlobali.h 
