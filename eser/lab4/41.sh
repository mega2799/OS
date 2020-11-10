#!/usr/bin/bash

# .Scrivereunoscriptreversebizzarro.shcheprendeunastringacomeunicoargomentoemetteinoutputlastringaconicaratteriinordineinvertito,ilprimoandràperultimo,l'ultimoperprimo.Percomplicarvilavita,perimplementarequestoscriptpoteteutilizzaresoloassegnamentiavariabili,cicliedifapiacere,edicomandiechoreadecut.Sisupponechelastringapassatacomeargomentononcontengacaratteriemetacaratteriinterpretatidallabash. 

str=$1 
len=${#str}
reverse=""
while (( $len > 0 ));do
	reverse=$reverse`echo $str | cut -c $len`
	len=$(( $len - 1 ))
done;
echo $reverse 
