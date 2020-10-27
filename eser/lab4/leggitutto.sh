#!/bin/bash

file=miofileNoNL.txt

while read riga; do
	echo $riga
done < $file
