#!/bin/bash

# Scrivere uno script bashleggerecaratteri.shche legge uno per uno i caratteri del file /usr/include/stdio.he stampa  a video il numero dei caratteri letti dal file

# Con i FD

# exec {file}< /usr/include/stdio.h
# COUNT=0
# while read -u $file -N 1 -r A ; do
# 	COUNT=$(( $COUNT + 1 ))
# done
# exec {file}>&-
# echo $COUNT

# Senza :)

file=/usr/include/stdio.h
COUNT=0
while read -N 1 -r A ; do
	COUNT=$(( $COUNT + 1 ))
done < $file
echo $COUNT
