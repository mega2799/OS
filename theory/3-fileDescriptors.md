# FD

Il file Descriptor è un astrazione che permette l'accesso ai file, ogni FD è rappresentato da un Integer 

Ogni processo ha la propria tabella dei file aperti che contiene due colonne, la prima in cui un numero intero indica il FD e nella colonna accanto il puntatore verso il FD della Tabella di Sistema dei file aperti che può reindirizzare il flusso del file verso ad esempio il monitor, un' altro file .... 

In POSIX ogni processo è inizialmente associato a 3 FD standard : 

- stdin(0) Input normale ( default da tastiera)
-  stdout(1) Output normale ( default monitor)
-  stderr(2) Output che serve a comunicare messaggi di errore all'utente ( default monitor )

Una shell B figlia di una shell padre A (e in generale, un processo B figlio di un processo A)  eredita una copia della tabella dei file apertidel padre, quindi padre e figlio leggono e scrivono sugli stessi stream![FD-subshell](htpps://github.com/mega2799/OS/blob/main/images/FD-subshell.png)
Uno script bash può dover usare dei file su disco per poter fare I/O, aprendo un nuovo file dal disco ottengo un nuovo FD che lo rappresenta, è possibile quindi utilizzarlo per accedere a quel file sostituendo i classici STDIN STDOT e STDERR 

Modo Apertura | 				Utente sceglie									| 		Sistema sceglie FD 

Solo Lettura 	##				exec n<  PercorsoFile    		##					 exec{NomeVar}<   Percorso

FileScrittura  		##			   exec n>   PercorsoFile  			##				  exec  {NomeVar}>   PercorsoFile 

Aggiunta in coda   	##		  exec n>> PercorsoFile 					##		  exec  {NomeVar}>>  PercorsoFile

Lettura e Scrittura  	##		exec n<> PercorsoFile 			##	        exec{NomeVar}<>   PercorsoFile

La variabile $$ indica il PID della shell in cui attualmente sto lavorando, posso utilizzare il comando `ls /proc/$$/fd` per poter vedere la Tabella dei file aperti del processo 

Qualunque sia il modo di apertura con cui ho aperto un file , posso chiedere lo stream attraverso il comando `exec n>&-` dive n è il FD da chiudere



