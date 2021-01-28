#include <pthread.h> 
#include <unistd.h> 
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void * thread_function(void* ret){
	sleep(5);
	printf("Value: %f\n", *(double*)ret);
	free(ret);
	pthread_exit(NULL);
}

#define N_THREAD 10 
int main(int argc, char **argv) {
	pthread_t thread_id; 
	int rc, i;
	double* r;

	srand(time(NULL));
	for (i = 0; i < N_THREAD; i++){
		r = malloc(sizeof(double));
		if(r == NULL){
			printf("Bad Alloc");
			exit(-1);
		}
		*r = (double) ( rand()%100000);
		rc = pthread_create (&thread_id, NULL, thread_function, r);
		if(rc){
			printf("failed to create thred"); 
			exit(-1);
		}
	}
	pthread_exit(NULL);
}
