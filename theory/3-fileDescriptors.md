# FD

Il file Descriptor è un astrazione che permette l'accesso ai file, ogni FD è rappresentato da un Integer 

Ogni processo ha la propria tabella dei file aperti che contiene due colonne, la prima in cui un numero intero indica il FD e nella colonna accanto il puntatore verso il FD della Tabella di Sistema dei file aperti che può reindirizzare il flusso del file verso ad esempio il monitor, un' altro file .... 

In POSIX ogni processo è inizialmente associato a 3 FD standard : 

- stdin(0) Input normale ( default da tastiera)
-  stdout(1) Output normale ( default monitor)
-  stderr(2) Output che serve a comunicare messaggi di errore all'utente ( default monitor )

Una shell B figlia di una shell padre A (e in generale, un processo B figlio di un processo A)  eredita una copia della tabella dei file apertidel padre, quindi padre e figlio leggono e scrivono sugli stessi stream eventualmente il processo padre può decidere di cambiare gli stream da far usare al figlio associando, a ciuscun FD da passare al figlio uno stream diverso ( in questo caso i FD passati al figlio avranno lo stesso identificatore numerico del padre ma saranno associati a FD diversi )
![FD-subshell](https://github.com/mega2799/OS/blob/main/images/FD-subshell.png)
Uno script bash può dover usare dei file su disco per poter fare I/O, aprendo un nuovo file dal disco ottengo un nuovo FD che lo rappresenta, è possibile quindi utilizzarlo per accedere a quel file sostituendo i classici STDIN STDOT e STDERR 

<pre>

Modo Apertura | 				Utente sceglie									| 		Sistema sceglie FD 

Solo Lettura 			exec n<  PercorsoFile    				 exec{NomeVar}<   Percorso

FileScrittura  		 exec n>   PercorsoFile  				  exec  {NomeVar}>   PercorsoFile 

Aggiunta in coda   	  exec n>> PercorsoFile 					  exec  {NomeVar}>>  PercorsoFile

Lettura e Scrittura  		exec n<> PercorsoFile 		        exec{NomeVar}<>   PercorsoFile

</pre> 

La variabile $$ indica il PID della shell in cui attualmente sto lavorando, posso utilizzare il comando `ls /proc/$$/fd` per poter vedere la Tabella dei file aperti del processo 

Qualunque sia il modo di apertura con cui ho aperto un file , posso chiedere lo stream attraverso il comando `exec n>&-` dove n è il FD da chiudere



### Ridirezionamenti di Stream di I/O 

Un processo può decidere di aprire nuovi file, chiudere file aperti o di associare un proprio FD ad un altro stream cambiando <u>soltanto</u> il puntatore nella seconda colonna della prorpio tabella dei file aperti auto-ridirezionandosi  : 

- `<` ricevere input da file 

  - `program < input_file`

- `> `mandare STDOUT verso file eliminando il vecchio contenuto

  - `program > output_file`

    > In questo caso il puntatore del STDOUT viene subisce un replacement con il puntatore di `output_file` presente nella tabella di sistema dei file aperti ( il vecchio stream di output viene chiuso) 

  - Duplice ridirezionamento  `program < nome_file_input > nome_file_output`

  - Ridirezioanare STOUT e STDERR su uno stesso file `program  &> nome_file_error_and_output`

- `>>` mandare STDOUT verso file mantenendo il vecchio contenuto, scrivendo in coda 

- `|` ridirigere OUTPUT di un programma nell INPUT di un altro programma

  - `history | grep sudo` 

In generale è possibile ridirezionare lo stream verso un qualsiasi file purchè si sappia il suo valore N 

`N> NomeFileTarget` `<N NomeFileSource`

----

Se una bash ha due stream dello stesso tipo (OUT/IN) identificati da FD N,M è possibile ridirigere lo stream N sullo stream M mediante l'operatore `N>&` a livello di tabelle di file del processo succede che il puntatore di N viene sovrascritto con una copia del puntatore di N della stessa tabella 

> es: `ls file.txt 2>&1` succede che lo STDERR di ls viene ridirezionato verso lo STDOUT di ls 

