#!/usr/bin/bash
(
head -n 5 /usr/include/stdio.h | tail -n 3 ;
tail -n 4 /usr/include/stdio.h | cut -b -3 
) | (
read riga1; read riga2; echo $riga2; echo $riga1;
read riga &>/dev/null
while read riga; do echo ${#riga}; done
)
