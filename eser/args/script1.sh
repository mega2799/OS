#!/bin/bash
for arg in $@; do
	echo $arg
done
echo calling script2 just right now!
./script2.sh $@
