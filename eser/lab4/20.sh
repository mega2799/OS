#!/bin/bash

# Stampare a video le sole righe del file /usr/include/stdio.hche contengono almeno un asterisco *   Suggerimento1: utilizzare il comando grepma  senza usare l'operatore |Suggerimento2: Guardare il man di grepper capire come usare grepin modo opportuno.

file=/usr/include/stdio.h

grep "*" $file --color
