CFLAGS=-ansi -Wpedantic -Wall -D_THREAD_SAFE -D_REENTRANT -D_POSIX_C_SOURCE=200112L
LFLAGS=-lpthread 

all: exe

exe: main.o 
	gcc ${CFLAGS} -o exe main.o ${LFLAGS} 

main.o: main.c 
	gcc -c ${CFLAGS} main.c 

.PHONY: clean 

clean:
	rm -rf *.o exe 
