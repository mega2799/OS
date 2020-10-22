#!/usr/bin/bash
PIPPO=${USER}@${HOME}\ in\ ${PWD}
echo gonna export ${PIPPO}
#source ./expShell.sh
#il comando source permette di creare una shell figlia che eredita le variabili
#ma la subshell deve chiamare la variabile gia dichiarata qua
VAR=${PIPPO} ./expShell.sh
#cosi dichiaro una variabile e la passo imediatamente all shell figlia

