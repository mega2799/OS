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

typedef struct s{
	unsigned int indice;
	pthread_t tid;
} S;

void *func(void *arg)
{
	void *pret; int res; pthread_t tid;
	S *p1, *p=(S*)arg;

	printf("indice %d\n", p->indice);fflush(stdout);
	usleep(1000);

	p1=malloc(sizeof(S));
	if(p1==NULL) { perror("malloc failed"); exit (1); }
	p1->indice= (S*)arg->indice+1;
	p1->tid=pthread_self();
	res=pthread_create (&tid, NULL, func, (void*)p1 );
	if (res){ printf("pthread_create() failed: error %i\n", res); exit(1);}

	res=pthread_join( p->tid, &pret );
	if(res!=0){ printf("pthread_join() failed: error %i\n",res); exit(1); }
	free(arg);
	pthread_exit (NULL);
}

int main()
{
	int res; pthread_t tid;
	S *p1;

	printf("main indice 0\n"); fflush(stdout);
	usleep(1000);
	p1=malloc(sizeof(S));
	if(p1==NULL) { perror("malloc failed"); exit (1); }
	p1->indice=1;
	p1->tid=pthread_self();
	res=pthread_create (&tid, NULL, func, (void*)p1 );
	if (res){ printf("pthread_create() failed: error %i\n", res); exit(1);}

	printf("fine main\n"); fflush(stdout);
	
	pthread_exit (NULL);
	return(0);
}


