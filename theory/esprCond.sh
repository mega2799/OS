# Espr condizionali

# exit status = 0 >> vero
# exit status = 1 >> falso

# le condizioni non possono essere comandi ma condizioni, posso però eseguire comandi sfuttando la command substitution `` per generare solo gli operandi !!
# all interno delle [[]], posso usare and,or, not ed espressioni aritmetiche
# tramite il $(()) ma non il (()) , usare invece le semplici parentesi tonde
# serve a dare una priorità alle condizioni
# posso usare gli operatori di condizione ( -e ) che non possono essere quotati ne generati da una command substitution

# COSA POSSO FARCI ?
# confronti aritmetici ( -eq -ne -le -lt -ge -gt )
# confronti non aritmetici tra stringhe ( == = != < <= > >= -z -n )
# verificar condizioni sui file ( -defhrstwxOgL )
# confrontare le date di ultima modifica dei file ( -nt -ot )
 VAR=10
NIN=90
 echo var=${VAR}
echo "90<100 ="
[[ ${NIN} < $((VAR*VAR)) ]]
echo res = $?

