#ParameterExpansion

#       $# il numero di argomenti passati allo script
#       $0 il nome del processo in esecuzione
#       $1 primo argomento,
#       $2 secondo argomento, .....
#       $* tutti gli argomenti passati a riga di comando concatenati e separati da spazi
#       $@ come $* ma se quotato gli argomenti vengono quotati separatamente, si usa anche quando uno script deve eseguire un altro comando passandogli tutti gli argomenti che ha ricevuto a riga di comando

# E' possibile valutare una stringa come se fosse una espressione costituita da operazioni aritmetiche tra soli numeri interi

RIS=$((18*42))
echo 18*42= ${RIS}

((RIS=20*42))
echo 20*42= ${RIS}

echo 13*76 = $((13*76))

echo unisco le stringe duemila=$((20*100))


