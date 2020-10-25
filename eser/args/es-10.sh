#!/bin/bash

# Scrivere uno script che usa anche il comando forper visualizzare, per ciascun file della directory corrente che non inizia per . , una coppia di righe in cui:la prima riga contiene la stringa “file is” seguita dal nome del filela seconda riga fa il listingdelle informazioni sul file. Se il file è una directory, il listingdeve contenere solo il nome della directory, non quello dei suoi files.

for name in `ls`; do
	echo -e "file is $name\n"
	if [[ -d $name ]];then
		echo "it's the $name directory"
	else
		ls -l $name
	fi;
done
