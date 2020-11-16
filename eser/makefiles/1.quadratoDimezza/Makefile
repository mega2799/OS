

CFLAGS=-ansi -Wpedantic -Wall -Werror 


all: main.exe

main.exe: main.o dimezza.o quadrato.o 
	gcc ${CFLAGS} -o main.exe main.o dimezza.o quadrato.o -lm
main.o: main.c
	gcc ${CFLAGS} -c main.c  
dimezza.o: dimezza.c
	gcc ${CFLAGS} -c dimezza.c  
quadrato.o: quadrato.c
	gcc ${CFLAGS} -c quadrato.c  
.PHONY: clear

clear:
	rm -f main.exe main.o quadrato.o dimezza.o 
