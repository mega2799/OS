# Brace Expansion
# Ciascuna stringa rappresenta una possibile scelta di stringhe che possono essere aggiunte al preambolo e seguite dal postscrittoper formare delle nuove stringhe di testo

 echo ma{tt,tti,zz}a
# Se voglio far generare stringhe con spazi bianchi, devo proteggere i singoli spazi con dei caratteri backslash

echo anche con lo spazioh
echo aa{bb,cc,d\ d}ee

echo anche tramite variabili
A=bin   echo $A
B=log   echo $B
C=boot  echo $C

echo ${A}{/${B},/${C}}/usr

#brace expansioncon SequenceExpression
echo alfabeto ma con m\(char\)

echo m\({a..z}\)

echo alfabeto ma con m\(char\) con il valore

#echo \({a..z}\){0..26}
n=0
for va in {a..z}; do echo ${va} ${n} && ((n=n+1));done
#echo \({a..z}\){0..26}

# Tilde expansion

# cd ~ ==> cd /home/mega


#WidlCards

# I Metacaratteri *e ?sono caratteri che vengono inseriti dall’utente nei comandi digitati e che la
# shell interpreta cercando di sostituirli con una sequenza di caratteri per ottenere i nomi di files nel filesystem

# * può essere sostituito da una qualunque sequenza di caratteri, anche vuota.
# ? può essere sostituito da esattamente un singolo carattere.
# [elenco]puo’ essere sostituito da un solo carattere tra quelli specificati in elenco.

# [abk]puo’ essere sostituito da un solo carattere tra a  b  oppure k.
# [1-7]puo’ essere sostituito da un solo carattere tra 1 2 3 4 5 6 oppure 7.
# [c-f]puo’ essere sostituito da un solo carattere tra  c d e oppure f.
# [[:digit:]] puo’ essere sostituito da un solo carattere numerico (una cifra).
# [[:upper:]]puo’ essere sostituito da un solo carattere maiuscolo.
# [[:lower:]]puo’ essere sostituito da un solo carattere minuscolo.

