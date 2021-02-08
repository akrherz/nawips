#include "gen_ltng_ascii.h"

int read_lghtng_strikes_nmin ( int num_mins, int num_files, char lightning_files[N_MCIDAS][16], 
                                int minutes_to_use[N_MCIDAS][60], int num_min_this_hour[N_MCIDAS], 
                                char n_minute_file[18] )

/************************************************************************
 * read_lghtng_strikes_nmin                                             *
 *                                                                      *
 * This routine reads n minutes' worth of lightning strike data         *
 * from McIDAS lightning strike data file(s) and writes out this data   *
 * to an ASCII file. The ASCII file is known as "the n-minute file".    * 
 *                                                                      *
 * read_lghtng_strikes_nmin ( num_mins, num_files, lightning_files,     *
 *                            minutes_to_use, num_min_this_hour,        *
 *                            n_minute_file )                           *
 *                                                                      *
 * Input parameters:                                                    *
 *      num_mins                  int        Number of mintues' worth   *
 *                                           of lightning data          *
 *                                           requested by the user      *
 *                                           [1..MAX_MINUTES]           *                 
 *      num_files                 int        Number of McIDAS           *
 *                                           lightning strike data      *
 *                                           files needed.              *
 *      lightning_files           char[][]   Names of McIDAS light-     *
 *                                           ning files needed.         *
 *      minutes_to_use            int[][]    Array containing each of   *
 *                                           the 2 digit minutes in     *
 *                                           the n-minute time range    *
 *                                           for each hour.             *
 *      num_min_this_hour         int[]      The number of minutes in   *
 *                                           this hour represented in   *
 *                                           the n-minute file          *
 *      n_minute_file             char[]     Filename of n-minute ASCII *
 *                                           lightning strike file      *
 *                                           produced.                  *
 **                                                                     *
 * Log:                                                                 *
 * G. McFadden/IMSG               11/12                                 *                                              
 ************************************************************************/
{

   int i, j, k, ier;
   int nstrk[MIN_PER_HR], count_pos[MIN_PER_HR], count_neg[MIN_PER_HR];
   float rlat[MIN_PER_HR][2][MAX_STK_MIN], rlon[MIN_PER_HR][2][MAX_STK_MIN];
   float secs[MIN_PER_HR][2][MAX_STK_MIN], ints[MIN_PER_HR][2][MAX_STK_MIN];
   char year[5], month[3], day[3], hour[3];
   FILE *fp;

/*---------------------------------------------------------------------*/


   /*
    *  Open the n-minute file.
    */
   fp = fopen(n_minute_file,"w" );
    
   /*
    *  For each hour...
    */
   for ( i = 0; i < num_files; i++ ) {

   /*
    *  Call the Fortran subroutine that actually reads the lightning data
    *  from this lightning data file. 
    */
      printf("calling read_lightning\n");
      read_lightning ( lightning_files[i], nstrk, rlat, rlon, secs, 
                        ints, count_pos, count_neg, &ier, 
                        strlen(lightning_files[i]) );

  
   /*
    *  Get the year, month, day, and hour of this 
    *  lightning file, so we can tag lightning obs
    *  with them.
    */
      year[0] = lightning_files[i][0]; 
      year[1] = lightning_files[i][1]; 
      year[2] = lightning_files[i][2]; 
      year[3] = lightning_files[i][3]; 
      year[4] = '\0';
  
      month[0] = lightning_files[i][4]; 
      month[1] = lightning_files[i][5]; 
      month[2] = '\0'; 
 
      day[0] = lightning_files[i][6]; 
      day[1] = lightning_files[i][7]; 
      day[2] = '\0'; 

      hour[0] = lightning_files[i][8]; 
      hour[1] = lightning_files[i][9]; 
      hour[2] = '\0';

   /*
    * Write each minute's of this hour's strike data to the n-minute file
    */
      for ( j = 0; j < num_min_this_hour[i]; j++ ) {

   /*
    * Write the positive strike data for this minute to the n-minute file
    */
         for ( k = 0; k < count_pos[minutes_to_use[i][j]]; k++ ) 
            fprintf(fp, "%s %s %s %s %2.2d %f %f %f %f\n",
                    year, month, day, hour, minutes_to_use[i][j], 
                    secs[minutes_to_use[i][j]][0][k],
                    rlat[minutes_to_use[i][j]][0][k],
                    rlon[minutes_to_use[i][j]][0][k],
                    ints[minutes_to_use[i][j]][0][k]);
   /*
    * Write the negative strike data for this minute to the n-minute file
    */
         for ( k = 0; k < count_neg[minutes_to_use[i][j]]; k++ ) 
            fprintf(fp, "%s %s %s %s %2.2d %f %f %f %f\n",
                    year, month, day, hour, minutes_to_use[i][j], 
                    secs[minutes_to_use[i][j]][1][k],
                    rlat[minutes_to_use[i][j]][1][k],
                    rlon[minutes_to_use[i][j]][1][k],
                    ints[minutes_to_use[i][j]][1][k]);
 
         printf("Finished writing strike data for minute %d of %s %s %s %s\n",minutes_to_use[i][j],year,month,day,hour);

      }

   }
 
   /* 
    * Close the ASCII n-minute file and exit/ 
    */
   fclose(fp);

   return (0);
}
