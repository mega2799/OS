#!/bin/bash

for name in `ls /usr/bin/?{c..g}*`;do
	if [[ ${#name} -lt 18  ||  ${#name} -gt  23 ]]; then
		echo ${name}
		fi
	done
