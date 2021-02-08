#include "geminc.h"
#include "gemprm.h"

#define N_MCIDAS 12
#define MAX_MINUTES 600
#define MAX_STK_MIN 5000
#define MIN_PER_HR  61

#ifdef UNDERSCORE
#define read_lghtng_strikes_nmin  read_lghtng_strikes_nmin_
#define read_lightning		  read_lightning_
#endif

int read_lghtng_strikes_nmin ( int, int, char[N_MCIDAS][16], int[N_MCIDAS][60], int[N_MCIDAS], char[18] );
void read_lightning ( char[N_MCIDAS], int[MIN_PER_HR],
       		float[MIN_PER_HR][2][MAX_STK_MIN], float[MIN_PER_HR][2][MAX_STK_MIN],
	       	float[MIN_PER_HR][2][MAX_STK_MIN], float[MIN_PER_HR][2][MAX_STK_MIN],
	       	int[MIN_PER_HR], int[MIN_PER_HR], int*, int );

