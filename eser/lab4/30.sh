#!/bin/bash
# Aggiungere in pipe il comando word count(wc) e fargli contare il totale dei caratteri contenuti nelle righe visualizzate sullo standard output.

cut -b 3-5,10-15  28.txt | sed 's/ //g' | sed 's/*//g' | sed 's/\t//' | wc -c
