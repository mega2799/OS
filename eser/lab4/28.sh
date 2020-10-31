#!/bin/bash

# Scrivere un file di testo di almeno 5 righe, ciascuna contenente almeno 7 parole separate da spazi e da tabulazioni. Mettete in qualche parola anche un asterisco *. Poi utilizzare il comando cut per visualizzare a video, di ciascuna riga, solo i caratteri dal terzo al quinto e dal decimo al quindicesimo,  compresi gli estremi.

cut -b 3-5,10-15  28.txt
