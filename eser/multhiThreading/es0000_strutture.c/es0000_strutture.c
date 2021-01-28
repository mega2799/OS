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

#define NUM 4 

typedef struct s{
	int remain;
	char str[100];
	int index;
} S;

void * fun(void *arg){
	S *s = (S*)arg, *str;
	int t, res;

	sleep(1);
	if(s->remain > 1){
		pthread_t coda2[NUM];
		for(t=0; t < s->remain - 1; t++){
			str = (S*)malloc(sizeof(S));

			if(str==NULL) {                                                           
              perror("malloc failed: ");                                          
              pthread_exit (NULL);                                                
			}
			str->index = s->index;
			str->remain = s->remain - 1;
			strcpy(str->str, "thread figlio di thread");

			res = pthread_create(&coda2[t], NULL, fun , str );
			if (res){                                                               
				printf("ERROR; return code from pthread_create() is %d\n",res);      
				exit(1);                                                            
        	   }
		}

		for(t = 0; t < s->remain - 1; t++){
			res = pthread_join(coda2[t], (void**)&str);
			if (res){                                                               
				printf("ERROR; return code from pthread_join() is %d\n",res);      
				exit(1);                                                            
		       }  
			fflush(stdout);
			printf("%s, from num: %d \n", str->str, str->index);
			free(str);
	}
		
	}
	printf("Sono il thread padre n. %d, sei una %s \n", s->index, s->str );
	pthread_exit(s);
}

int main()
{
	pthread_t coda[NUM];
	int res, t; 

	S *p;

	for(t = 0; t < NUM; t++){
		
		p = (S*)malloc(sizeof(S));
		if(p==NULL) {                                                           
              perror("malloc failed: ");                                          
              pthread_exit (NULL);                                                
          }
		
		p->remain = NUM;
		strcpy(p ->str, "MERDA");
		p->index = t;
		printf("Creating thread n. %d \n", t);
		res = pthread_create(&coda[t], NULL, fun , p );
		if (res){                                                               
			printf("ERROR; return code from pthread_create() is %d\n",res);      
			exit(1);                                                            
          }  
	}

	
	for(t = 0; t < NUM; t++){
		res = pthread_join(coda[t], (void**)&p);
		if (res){                                                               
			printf("ERROR; return code from pthread_join() is %d\n",res);      
			exit(1);                                                            
           }
		printf("From thread n. %d main received %s \n", p->index, p->str);
		free(p);
	}

	printf("fine main\n"); fflush(stdout);
	
	pthread_exit (NULL);
	return(0);
}
