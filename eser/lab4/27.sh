#!/bin/bash

# Scrivere il file di testo asterischi.txtche contiene le seguenti linee di testo, ciascuna formata da 4 parole. Il file verrà usato come standard input per lo script   star.sh uno   due  tre  quattro alfa beta   *    gamma one two three four Scrivere poi lo script  star.shche deve leggere una per una le righe provenienti dallo standard input e stampare a video, per ciascuna riga, la quarta e la  terza parola della riga, in quest'ordine, separate da spazi.L'output dovrà essere :quattro   tregamma   *fourthree Lanciare lo script star.sh passandogli nello standard input il contenuto del file asterischi.txt.



exec {FD}< asterischi.txt # apro lo stream

while read -u ${FD} a b c d ;do
	echo "$d $c";
done;
exec {FD}>&- # notare che non ci sono spazi
