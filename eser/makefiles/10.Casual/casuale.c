#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

int main(int argc, char **argv) {
	srand(2);
	while(1){
		u_int8_t val = rand() % 10;
	printf("%d\n",val);
	if(val == 3)
		exit(0);
	}
}
