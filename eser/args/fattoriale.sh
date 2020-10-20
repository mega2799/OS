#!/bin/bash
NUM=$1
RES=$NUM
while (( $NUM  !=  1 )) ; do
	(( NUM = $NUM - 1 ))
	(( RES = $RES * $NUM ));
done

echo $RES
