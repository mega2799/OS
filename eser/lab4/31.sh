#!/bin/bash

# Supponendo che in ciascuna riga del file di testo ci siano al massimo un carattere di andata a capo di tipo \ned uno di tipo "carriagereturn" \r, alloraaggiungere alla riga di comando dell'esercizio 29, in pipe, tanti comandi sedper eliminare dall'output finale anche tutte le andate a capo \ne \r.

cut -b 3-5,10-15  28.txt | sed 's/ //g' | sed 's/*//g' | sed 's/\t//' | sed -z 's/\n//' | sed 's/\r//' | wc -c

# Quando elimino le andate a capo, metto il flag -z che serve affinché sed non metta una andata a capo nell'output dopo avere processato una riga, e al suo posto metta un carattere ascii null di valore 0. Attenzione che se mancano le andate a capo, le successive chiamate a sed non sanno più dove finiscono le righe
