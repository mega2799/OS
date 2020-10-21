#!/bin/bash

# Partendo dall’esercizio precedente, scrivere uno script chiama_fattoriale1.shil quale crea una variabile condivisa RIS, invoca in modo opportuno  lo script fattoriale1.shpassandogli l’argomento 5, ottiene il risultato che viene messo dallo script fattoriale1.sh nella variabile RIS e ne stampa a video il contenuto. Scrivere uno script fattoriale1.sh che chiami sé stesso ricorsivamente per calcolare il fattoriale del numero passato come argomento. A differenza del caso precedente, il risultato di ogni invocazione deve essere scritto in una variabile condivisa (in entrambe le direzioni) tra chiamante e chiamato di nome RIS.
RIS=0
source ./fattoriale.sh 5
echo $RIS

