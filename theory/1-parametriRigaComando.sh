#ParameterExpansion

#       $# il numero di argomenti passati allo script
#       $0 il nome del processo in esecuzione
#       $1 primo argomento,
#       $2 secondo argomento, .....
#       $* tutti gli argomenti passati a riga di comando concatenati e separati da spazi
#       $@ come $* ma se quotato gli argomenti vengono quotati separatamente, si usa anche quando uno script deve eseguire un altro comando passandogli tutti gli argomenti che ha ricevuto a riga di comando


# Parametri a riga di comando passati al programma (6)Differenze tra $* e  $@I parametri $* e $@
# sono uguali quando non quotati dai ", cioè sono la concatenazione separata da blank dei singoli argomenti
#  $* == $@  --->  $1  $2  $3 ... $n
# "$*"    --->  "$1  $2  $3 ... $n"quotati tutti gli argomenti assieme
# "$@"  ---> "$1"  "$2"  "$3" ... "$n"quotato singolarmente ogni argomento

# Operatori aritmetici ((  )) e $((  ))

# E' possibile valutare una stringa come se fosse una espressione costituita da operazioni aritmetiche tra soli numeri interi

RIS=$((18*42))
echo 18*42= ${RIS}

((RIS=20*42))
echo 20*42= ${RIS}

echo 13*76 = $((13*76))


# Indirect referencies to variables ${!

varA=pippo
nomevar=varA
echo ${!nomevar} # stampa a video pippo
