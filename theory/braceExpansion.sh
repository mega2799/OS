# Brace Expansion
 #Ciascuna stringa rappresenta una possibile scelta di stringhe che possono essere aggiunte al preambolo e seguite dal postscrittoper formare delle nuove stringhe di testo

 echo ma{tt,tti,zz}a
# Se voglio far generare stringhe con spazi bianchi, devo proteggere i singoli spazi con dei caratteri backslash

echo anche con lo spazioh
echo aa{bb,cc,d\ d}ee

echo anche tramite variabili
A=bin
B=log
C=boot

echo ${A}{/${B},/${C}}/usr

#brace expansioncon SequenceExpression
echo alfabeto ma con m\(char\)

echo m\({a..z}\)

echo alfabeto ma con m\(char\) con il valore

#echo \({a..z}\){0..26}
n=0
for va in {a..z}; do echo ${va} ${n} && ((n=n+1));done
#echo \({a..z}\){0..26}
