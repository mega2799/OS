#!/bin/bash

# Stampare a video le sole righe del file /usr/include/stdio.hche NON contengono alcun asterisco *   Suggerimento2: Guardare il man di grepper capire come usare grepin modo opportuno.
file=/usr/include/stdio.h

grep -v "*" $file --color

