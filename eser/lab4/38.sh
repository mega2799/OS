#!/usr/bin/bash 
# Scrivereunfilecontenentealcune(almeno5)righeditesto,ciascunaconalmeno4parole.Scrivereunoscriptseconda.shcheprendecomeunicoargomentoilnomediquelfile.Dentroloscriptutilizzareripetutamenteilcomandoreadperleggerelasecondaparoladiognirigadelfile.TuttelesecondeparoledevonoessereconcatenatainunavariabiledinomeOUT.Allafinedelloscript,lavariabileOUTdeveesserevisualizzatasullostandardoutput 
exec {FD}< $1
OUT=""
while read -u ${FD} a b;do
	OUT=${OUT}${b}
done;
echo $OUT 
exec {FD}<&-
