CFLAGS=-ansi -std=gnu99 -Wpedantic -Werror -Wall 

all: exe

exe: casuale.o
	gcc ${CFLAGS} -o exe casuale.o 

casuale.o: casuale.c 
	gcc ${CFLAGS} -c casuale.c

.PHONY: clear 

clear:
	rm -f exe casuale.o *~ CORE
