#!/usr/bin/bash

for i in {1..10};do 
	./51.puntini.sh $1 >2 & echo $! ; 
done
