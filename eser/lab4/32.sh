#!/bin/bash

# Scrivere uno script cerca.shche prende come argomenti un percorso assoluto di una directory da cui cominciare la ricerca di alcuni ed una stringa che contiene un nome di file da cercare. Il nome potrebbe contenere dei metacaratteri, ad esempio il nome di file da cercare potrebbe essere   *std*-hLo script deve visualizzare a video il percorso assoluto  di tutti i file il cui nome corrisponde alla stringa passata come secondo argomento, partendo dalla directory specificata come primo argomento,e ncludendo nella ricerca tutte le sottodirectory.Scrivere poi uno script  lanciacerca.shche  lancia lo script cerca.shpassandogli nell'adatto modo proprio la directory iniziale  /usr/include/ e la  stringa  *std*.h a

path=$1 # percorso assoluto
name=$2 # file da cercare

find "$path" | grep "$name"  --color

