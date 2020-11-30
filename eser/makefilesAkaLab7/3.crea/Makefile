FLAGS=-ansi -Wpedantic -Werror -Wall -std=gnu99

elf: all 

all: main.o variabiliGlobali.o 
	gcc ${FLAGS} -o elf main.o variabiliGlobali.o 

main.o: variabiliGlobali.h 
	gcc ${FLAGS} -c main.c 

variabiliGlobali.h:
	./creaH.sh 

variabiliGlobali.o: variabiliGlobali.c 
	gcc ${FLAGS} -c variabiliGlobali.c 

variabiliGlobali.c:
	./creaC.sh 

.PHONY: clear 

clear:
	rm variabiliGlobali.h variabiliGlobali.c *.o elf 
