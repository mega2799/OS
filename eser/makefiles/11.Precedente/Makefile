CFLAGS=-g -ansi -std=gnu99 -Wpedantic -Wall -Werror 
 
all: exe 

exe: main.o 
	gcc ${CFLAGS} -o exe main.o 

main.o:
	gcc ${CFLAGS} -c main.c

.PHONY: clear 

clear: 
	rm -f main.o 
