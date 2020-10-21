#!/bin/bash

NUM=$1
RIS=$NUM

if (( $NUM  !=  1 )) ;then
	(( NUM = $NUM - 1 ))
	(( RIS = $RIS * $NUM ))
	source ./fattoriale1.sh ${NUM};
fi

