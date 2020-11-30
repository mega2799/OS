CFLAGS=-ansi -Wpedantic -Werror -Wall -std=gnu99

all: exe 

exe: main.o 
	gcc ${CFLAGS} -o exe main.o 

main.o:
	gcc ${CFLAGS} -c main.c 

.PHONY: clear 

clear: 
	rm -f exe main.o ~* CORE 
