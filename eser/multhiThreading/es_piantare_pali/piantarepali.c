/* file:  soccorsi_semplice.c */

#ifndef _THREAD_SAFE
	#define _THREAD_SAFE
#endif
#ifndef _POSIX_C_SOURCE
	#define _POSIX_C_SOURCE 200112L
#endif

#include "printerror.h"

#include <unistd.h> 
#include <stdlib.h> 
#include <stdio.h> 
#include <stdint.h>
#include <inttypes.h>
#include <pthread.h> 

#include "DBGpthread.h"

#define NUMPROF 1
#define NUMMEDICI 1
#define NUMESORCISTI 1

/* variabili globali da proteggere */
pthread_mutex_t mutex;
pthread_mutex_t Palimutex;
pthread_cond_t attesaPali;
pthread_cond_t attesaFine;
/* aggiungete le vostre variabili globali */
int paliLiberi = 0;
int coppie = 0;
int martellate = 0;
/*
int NumSoccorritoriArrivati=0;
pthread_cond_t condInizioSoccorso;
*/

/* ruoli */
#define RIPOSOMARTELLO1 7 
#define RIPOSOMARTELLO2 5 
#define RIPOSOTIENEPALO 3 
#define MAXPALIMARTELLATI 4
#define COPPIEMAXPALIIMPALATI 5

void *Martello(void *arg) 
{ 
	char Plabel[128];
	intptr_t indice;

	indice=(intptr_t)arg;
	sprintf(Plabel,"Martello%" PRIiPTR "",indice);

	while(1) {
	DBGpthread_mutex_lock(&mutex, Plabel);
		DBGpthread_cond_wait(&attesaPali, &mutex, Plabel);
	printf("%s inzia a martellare\n", Plabel);
	martellate++;
	DBGpthread_mutex_unlock(&mutex, Plabel);

	sleep(1);

	DBGpthread_mutex_lock(&mutex, Plabel);
	paliLiberi-= 1;
	printf("%s ha finito\n", Plabel);
	if(paliLiberi > 0){
		DBGpthread_cond_wait(&attesaFine, &mutex, Plabel);
	}else {
		DBGpthread_cond_broadcast(&attesaFine, Plabel);
	}

	if( martellate % 4 == 0){
		printf("%s si riposa\n", Plabel);
		if(indice == 0){
			sleep(RIPOSOMARTELLO1);
		}else {
			sleep(RIPOSOMARTELLO2);
		}
		printf("%s finito riposo\n", Plabel);
	}
	DBGpthread_mutex_unlock(&mutex, Plabel);
	}
	pthread_exit(NULL); 
} 

void *TienePalo(void *arg) 
{ 
	char Plabel[128];

	sprintf(Plabel,"TienePalo");
	
	while(1) {
	paliLiberi = 2;
	printf("%s ha messo due pali\n",Plabel);
	sleep(1);

	DBGpthread_mutex_lock(&mutex, Plabel);
	printf("%s: ora martellare\n", Plabel);
	DBGpthread_cond_broadcast(&attesaPali, Plabel);
	DBGpthread_cond_wait(&attesaFine, &mutex, Plabel);
	printf("pali piantati\n");
	
	if(coppie++ > COPPIEMAXPALIIMPALATI ){
		printf("%s stanco", Plabel);
		sleep(RIPOSOTIENEPALO);
	}

	DBGpthread_mutex_unlock(&mutex, Plabel);

	}
	pthread_exit(NULL); 
} 

int main ( int argc, char* argv[] ) 
{ 
	pthread_t    th; 
	int  rc;
	intptr_t i;

	/* inizializzazione variabili globali */
	rc = pthread_mutex_init(&mutex, NULL); 
	if( rc ) PrintERROR_andExit(rc,"pthread_mutex_init failed");

	rc = pthread_mutex_init(&Palimutex, NULL); 
	if( rc ) PrintERROR_andExit(rc,"pthread_mutex_init failed");

	rc = pthread_cond_init(&attesaPali, NULL); 
	if( rc ) PrintERROR_andExit(rc,"pthread_mutex_init failed");

	rc = pthread_cond_init(&attesaFine, NULL); 
	if( rc ) PrintERROR_andExit(rc,"pthread_mutex_init failed");


	/* inizializzate le vostre variabili globali */

	rc=pthread_create(&th,NULL,TienePalo,NULL); 
	if(rc) PrintERROR_andExit(rc,"pthread_create failed");

	for(i = 0; i < 2; i++){
	rc=pthread_create(&th,NULL,Martello, (void*)i); 
	if(rc) PrintERROR_andExit(rc,"pthread_create failed");
	}

	pthread_exit(NULL);
	return(0); 
} 
  
