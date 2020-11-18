#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <time.h>
#include <string.h>

u_int8_t dammi_il_precedente(u_int8_t arg){
	static u_int8_t prec = 0;
	u_int8_t tmp = prec;
	prec = arg;
	printf("%d\n",tmp);
	return tmp; 
}


int main(int argc, char **argv) {

	srand(time(NULL)); 
	while(1){
		if ( dammi_il_precedente(rand()) % 10 == 3) 
			exit(0);
	}
    return 0;
}
