#!/usr/bin/bash

while read parola;do
	var=${parola/"*"/"\\"}
	var=${var/"?"/"\\"}
	var=${var/"["/"\\"}
	var=${var/"]"/"\\"}
	echo $var
done;
