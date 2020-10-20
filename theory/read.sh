#!/bin/bash

# Il comando read legge dallo standard input e lo mette in diverse variabili
# ha exit status 0 se durante la lettura non è arrivata alla EOF ed ha letto qualcosa
# ha exit stauts 1 invece se raggiunge la EOF


#legge da STDIN e mette in STDOUT

while read RIGA;
	do echo $RIGA;
	echo "to stop press <ctrl+d>"
	done

# ora da file
while read RIGA;
	do echo $RIGA;
	done < readed.txt # < imposta come STDIN mette il filedescriptor del file readed invece del valore del file descriptor 0 (bash)

# per sicurezza occore controllare se nella variabile c'è ancora qualcosa dentro

#while read RIGA;
#	if (( $?==0 ));
#		then true;
#	elif (( ${#RIGA} != 0));
#		then true;
#	else false;
#		fi ;
#	do echo read  "${RIGA}" ;
#	done

# nel caso passi più variabili alla read lei cerca di assengargli il contenuto
echo ora con piu variabili
while read varA varB varC;
	do echo "$varA \n $varB \n $varC";
	done < readed.txt # < imposta come STDIN mette il filedescriptor del file readed invece del valore del file descriptor 0 (bash)

exec 103 < readed.txt # num di file descriptor a cui fare riferimento
read -N 4 -u 103 RIGA
echo $RIGA # prim
exec 103 < &- # chiudo tutto


