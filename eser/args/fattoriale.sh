#!/bin/bash
NUM=$1
RIS=$NUM
while (( $NUM  !=  1 )) ; do
	(( NUM = $NUM - 1 ))
	(( RIS = $RIS * $NUM ));
done


