/* con_trucco.c  */

/* messi nella riga di comando del compilatore 
#define _THREAD_SAFE
#define _REENTRANT
#define _POSIX_C_SOURCE 200112L
*/

#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <stdint.h>	/* uintptr_t */
#include <inttypes.h>	/* PRIiPTR */
#include <pthread.h>
#include <string.h> 

#define NUM_THREADS 5

int N=-1;

void *PrintHello(void *arg)
{
	printf("%" PRIiPTR "Hello World!\n " PRIiPTR, (intptr_t)arg);
	pthread_exit (NULL);
}

int main()
{
	pthread_t tid;
	int rc;
	intptr_t t;
	for(t=0;t > - 1;t++){

		printf("Creating thread %" PRIiPTR "\n", t);
		rc = pthread_create (&tid, NULL, PrintHello, (void*)t );
		if (rc){
			char errmsg[128];
			strerror_r(rc, errmsg, (size_t) 128); 
			/* printf("ERROR; return code from pthread_create() is %i \n",rc); */ 
			printf("pthread_create failed: %s\n ", errmsg );
			exit(1);
		}
	}

	 /* pthread_exit (NULL);  /* far vedere commentando questa riga */
	return(0);
}
