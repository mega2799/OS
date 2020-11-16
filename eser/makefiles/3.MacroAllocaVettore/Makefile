CFLAGS=-ansi -Wpedantic -Werror -Wall -std=gnu99
macro=alloc(x)={x=(uint*)malloc(NUM_BYTES);if( x != NULL){ for(int i=0;i<10;i++){x[i]= i - 1000;}}}

all: exe 

exe: main.o 
	gcc ${CFLAGS} -o exe main.o 

main.o:
	gcc ${CFLAGS} -c -D'${macro}'  main.c 

.PHONY: clear 

clear: 
	rm -f exe main.o ~* CORE 
