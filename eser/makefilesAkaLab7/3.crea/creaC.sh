#!/usr/bin/bash

num=0
exec {FD}<define.h 
while read -u ${FD} a b c;do
	num=$c
done;
exec {FD}<&-

echo "#include \"define.h\" "  >variabiliGlobali.c 

i=0
while (( ${i} != num + 1 )) ;do
	echo "unsigned int var${i} = ${i};" >> variabiliGlobali.c;
	i=$(( $i + 1 ))
done; 

echo -e "int conta(void){\nint sum=0;\nfor(int i=0;i<NUM;i++)\n\tsum+=i;\nreturn sum;\n}" >> variabiliGlobali.c 
