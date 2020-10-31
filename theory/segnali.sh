#!/bin/bash

# Un segnale è una interruzione software, provocata in un processo destinazione,per notificare un evento asincrono.
# Il comando kill invia segnali a processi, non uccide direttamente, il segnale viene accetato solo se il segnale
# proviene dall user che ha esegue il processo
# kill -SEGTERM PID oppure kill -15 PID
# kill -SIGKILL PID oppure kill -9 PID oppure kill -KILL PID
# possiamo usare il PID -1 per mandare il segnale a tutti i processi figli della bash corrente, ma solo se il
# processo è in esecuzione, se dovesse essere fermo (es sleep, I/O) ricevere il segnale e lo eseguirà solo
# dopo aver terminato lo sleep / termine di I/O

kill -l # visualizza l' elenco dei segnali

# è possibile impostare un interpretazione diversa di uno specifico segnale per un processo

# trap

#il comando trap definisce l' azione da eseguire al ricevimento di un elenco di segnali
trap "echo \"ricevuto SIGUSR1 !! Termino\"; exit 99" SIGUSR1

# il comando wait serve al processo padre per sapere quando il processo figlio termina
# wait $PID
# il comando wait mette il processo padre in attesa fino a quando il processo figlio non termina e poi
# restituisce come exit	status l' exit status del processo figli specificato dal PID


