#!/bin/bash

RANDOM=$(( `date +%s` % 32768 ))
COUNT=0
while (( ${RANDOM} % 10 != 2 ));do
	COUNT=$(( $COUNT + 1 ))
done;
echo num volte $COUNT
