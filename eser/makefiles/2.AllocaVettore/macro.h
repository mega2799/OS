#define NUM_BYTES 40
#define alloc(x) \
	x=(uint*)malloc(NUM_BYTES); \
	if( x != NULL){ for(int i=0;i<10;i++) \
		{ x[i]= i - 1000;}} 
