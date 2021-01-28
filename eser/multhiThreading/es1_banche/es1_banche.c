#ifndef _THREAD_SAFE                                                            
    #define _THREAD_SAFE                                                        
#endif                                                                          
#ifndef _POSIX_C_SOURCE                                                         
    #define _POSIX_C_SOURCE 200112L                                             
#endif                                                                          

#include <stdio.h>
#include "DBGpthread.h" 
#include "printerror.h"
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <pthread.h> 

#define N_BANCHE 3
#define N_DEPOSITI 5 
#define N_PRELIEVI 4 


double B[N_BANCHE ] = {0.0, 0.0, 0.0};
int Operation[N_BANCHE ] = {0, 0, 0};

pthread_mutex_t mutex;

void* Banca(void* arg){
	char st[128];

	sprintf(st, "BANCA");

	while(1){
		pthread_mutex_lock(&mutex);
		sleep(1);
		int i,op;
		op = 0;
		double tot;
		tot = 0.0;
		for(i = 0; i < N_BANCHE; i++){
			tot += B[i];
			op += Operation[i];
			fflush(stdout);
		}
		DBGpthread_mutex_unlock(&mutex, st);
		printf("tot Soldi %.2f Tot Operation %d \n", tot, op);
		sleep(10);
	}
	pthread_exit(NULL);
}

void * FuncDeposito(void * arg){
	char st[128];

	sprintf(st, "DEPOSITO");

	intptr_t indice;
	indice = (intptr_t) arg;

	while(1){
	sleep(1);
	DBGpthread_mutex_lock(&mutex, st);
		/*pthread_mutex_lock(&mutex);*/
			B[indice] += 10.0;
			Operation[indice] += 1;
			printf("I'm Deposit of bank n. %ld, total of %.2f, Operation n. %d \n",
					indice, B[indice], Operation[indice]);	
			fflush(stdout);
		DBGpthread_mutex_unlock(&mutex, st);
		/*pthread_mutex_unlock(&mutex);*/
	}
	pthread_exit(NULL);
}

void * FuncPrelievo(void * arg){
	char st[128];

	sprintf(st, "WITHDRAW");

	intptr_t indice;
	indice = (intptr_t) arg;
	while(1){
		sleep(1);
		DBGpthread_mutex_lock(&mutex, st);
		/*pthread_mutex_lock(&mutex);*/
			B[indice] -= 9.0;
			Operation[indice]++;
			printf("I'm Withdraw of bank n. %ld, total of %.2f, Operation n. %d \n",
					indice, B[indice], Operation[indice]);	
			fflush(stdout);
		DBGpthread_mutex_unlock(&mutex, st);
		/*pthread_mutex_unlock(&mutex);*/
	}
	pthread_exit(NULL);
}


int main(int argc, char **argv) {
	pthread_t th;
	pthread_t bancaDiItalia;

	int rc;
	intptr_t i,t;

	rc = pthread_mutex_init(&mutex, NULL);
	if (rc){                                                           
		printf("ERROR; return code from pthread_mutex_init() is %d\n",rc); 
        exit(1);                                                        
	}

	for(i=0; i < N_BANCHE; i++){
		for(t=0; t < N_DEPOSITI; t++){
			rc = pthread_create(&th, NULL, FuncDeposito,(void*)i);
			  if (rc){                                                           
    	              printf("ERROR; return code from pthread_create() is %d\n",rc); 
    	              exit(1);                                                        
    	             }
		}
		for(t=0; t < N_PRELIEVI ; t++){
			rc = pthread_create(&th, NULL, FuncPrelievo,(void*)i);
			  if (rc){                                                           
    	              printf("ERROR; return code from pthread_create() is %d\n",rc); 
    	              exit(1);                                                        
    	             }
		}
	}
		rc = pthread_create(&bancaDiItalia, NULL, Banca,(void*)i);
		if (rc){                                                           
    	      printf("ERROR; return code from pthread_create() is %d\n",rc); 
    	      exit(1);                                                        
	}

	pthread_exit(NULL);

	return 0;
}
