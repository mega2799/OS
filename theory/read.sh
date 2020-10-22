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
exec 103 <&- # chiudo tutto

# Rindirizzzamento
# Una subshell ha una copia dei file descriptor del padre che però puo decidere di modificare
# cosa può vedere il figlio, cambiando ad esempio lo stream
# Un processo puo in alterntiva auto ridirezionarsi avendo l' impressione di scrivere su un
# certo output mentre in realtà sta usando un altro file descriptor

# Operatori di ridirezionamento
# < (ricevere input da file ) > (mandare stdout verso file eliminandone il precedente contenuto)
# >> (mandare stdout verso file aggiungendosi al precedente contenuto) | (ridirige output di un altro programma)

# uso in contemporanea
# program < file_input > file_output

# ridireziono stderror e stdoutput
# program &> nome_file_error_and_output

# come prima ma in due file diversi
# program #> nome_file_error > nome_file_output (# numero file descriptor)

