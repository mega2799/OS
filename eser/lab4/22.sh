#!/bin/bash

# Scrivere uno script bashleggerecaratteri.shche legge uno per uno i caratteri del file /usr/include/stdio.he stampa  a video il numero dei caratteri letti dal file

file=/usr/include/stdio.h

while read a b c d ; do
	if [[ -n $c ]]; then # -n true if the length is not zero
	echo $c
	fi
done < $file

