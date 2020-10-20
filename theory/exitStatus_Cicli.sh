#exit status

#ogni comando/programma dopo la sua esecuzione produce un intero che restituisce
#compreso tra 0 e 255, posso usare un comando per poter scegliere questo valore, il
#valore 0 significa che tutto è andato come doveva andare
echo "exit 10"
#Una variabile d'ambiente cattura questo valore $?
echo "			il processo chiamato ha restituito il valore $?"
# cambio directory in una che non esiste
cd cacca
echo "			il processo chiamato ha restituito il valore $?"
echo "valore diverso !"
echo "non riesco ad eseguire il comando mi aspetto il 127"
cacca
echo "			il processo chiamato ha restituito il valore $?"

#Posso valutare anche l' exit status di un espressione matematica ((  ))
(( ls 5 ))
echo "il processo chiamato è errato ha restituito il valore $?"
(( 5>=2 ))
echo " 5 >= 2 è true ma ha exit status pari a $?"
(( 5<=2 ))
echo " 5 <= 2 è false  ma ha exit status pari a $?"
# se il risultato di un espressione matematica è zero allora l'exit status sarà 1
# se il risultato di un espressione matematica è diverso da zero allora l'exit status sarà 0
# la logica è invertita
((0))
echo " ((0)) => il processo chiamato è errato ha restituito il valore $?"
((4))
echo " ((4)) => il processo chiamato è errato ha restituito il valore $?"
# l'exit status restituito da una lista di comandi è quello dell' ulitmo comando esseguito

# comandi composti

# for varname in elencoword  ; do list ; done
# for (( expr1 ; expr2 ; expr3 )) ; do list ; done
# if listA ; then listB ; [ eliflistC ; thenlistD ;  ]  ...  [  elselistZ ; ] fi
# while list; do list; done

for name in a b c ; do echo ${name}; done

for (( i = 0; $i < 13; i = $i +1 )); do echo ciao $i ; done

if echo per if questa è una lista di comandi && echo "se l'exit status è 0 allora pwd"; then pwd fi ;

	while (($i < 30)) ;do echo $i ; done;

