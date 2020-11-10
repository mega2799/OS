#!/usr/bin/bash 

# Scrivereunoscriptelenco.shcheelencatuttiifileedirectorypresentinelladirectorycorrente(escludendodall'elencoladirectorycorrente,ladirectorysuperioreeifilesnascosti).Perciascunodiquestifileedirectory,loscriptcontrollasesitrattadiunadirectoryono.SesitrattadiunadirectoryloscriptcontalalunghezzadelnomedelladirectoryeloaccumulainunavariabilelocaleLungNomiDirectory.Loscript,inoltrecontaifilechenonsonodelledirectory.Altermineloscriptvisualizzainoutputilnumerodifileditiponondirectoryelalunghezzaaccumulatadeinomidelledirectorylette

LUNG=0
FILES=0
for files in `ls ./`;do
	if [[ -d $files ]];then
		LUNG=$(( $LUNG + ${#files} )) 
	else
		FILES=$(( $FILES + ${#files} )) 
	fi;
done; 
echo $LUNG charchters of directory    
echo $FILES charchters of file
