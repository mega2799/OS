#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <time.h>
#include <string.h>

#define NUM_BYTES 40	
int main(int argc, char **argv) {
	u_int* vet;
	alloc(vet) 
	for(int i=0;i <10; i++){
		printf("vet[%d]: %d\n",i, vet[i]);
		vet[i] = i - 19 ;
		printf("vet[%d]: %d\n",i, vet[i]);
	}
	free(vet);
    return 0;
}
