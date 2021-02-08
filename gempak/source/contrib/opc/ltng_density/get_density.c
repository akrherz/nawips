#include "geminc.h"
#include "gemprm.h"

#ifdef UNDERSCORE
#define get_density	get_density_
#endif

int xdim,ydim;
void get_density ( char[], char[], char *, char *, int *, int *, float [xdim][ydim] );

/********************************************************************************
 * get_density.c                                                               	*
 *                                                                              *
 * CONTENTS                                                                     *
 * get_density.c                                                                *
 *******************************************************************************/

/********************************************************************************
 * get_density.c                                                                *
 *                                                                              *
 * This function gets ASCII lightning strike data from a file and computes the  *
 * lightning strike density at each gridpoint from these data.                  * 
 *                                                                              *
 * Input                                                                        *
 *  strikes_file        char[]      Filename of file containing the ASCII       *
 *                                  lightning strike data.                      *
 *   nmin_digits        char[]      Character representation of the number of   *
 *                                  digits in the number of minutes' worth of   *
 *                                  lightning strike data                       *
 *            kx        int*        Pointer to number of gridpoints in the x    *
 *                                  direction.                                  *
 *            ky        int*        Pointer to number of gridpoints in the y    *
 *                                  direction.                                  *
 *     ctime_res       char*        Pointer to character representation of time *
 *                                  resolution.                                 *
 *    cspace_res       char*        Pointer to character representation of      *
 *                                  space resolution.                           *
 * Output                                                                       *
 *  density_grid      float[][]     Grid array of lightning strike densities.   *
 *                                                                              *
 **                                                                             *
 * Log:                                                                         * 
 * G. McFadden/IMSG   12/12                                                     *
 *                                                                              *
 *******************************************************************************/
void get_density( char strikes_file[20], char nmin_digits[2], char *ctime_res, char *cspace_res,
                   int *kx, int *ky, float density_grid[*ky][*kx] )
{
     FILE *fp;
     int year, month, day, hour, minute, nmin; 
     float second, lat, lon, strength;
     int i, j, iret, one = 1;
     float rgridlatdex, rgridlondex;
     int gridlatdex, gridlondex;
     char  *mapco = "M";
     char  *gridco = "G";
     float space_res, time_res;

/*------------------------------------------------------------------------------*/

   /*
    * Get the floating point representation of the time and space resolutions.
    */
   time_res = (float) atof(ctime_res);
   space_res = (float) atof(cspace_res);

   /*
    * Do some error checking on space and time resolution...exit if there's a problem.
    */
   if ( space_res <= 0.0 || time_res <= 0.0 ) {
      fprintf ( stderr, "get_density: Time or Space Resolution error, exiting ltng_density\n");
      exit (0);
   }

   /*
    * Initialize grid array of strike densities.
    */
   for ( i = 0; i < *ky; i++ )
   for ( j = 0; j < *kx; j++ )
      density_grid[i][j] = 0.0;

   /*
    * Null terminate the ASCII lightning strikes data filename.
    */
   nmin_digits[1] = '\0';
   nmin = atoi(nmin_digits);
   if ( nmin == 1 )
      strikes_file[14]='\0';
   else if ( nmin == 2 )
      strikes_file[15]='\0';
   else
      strikes_file[16]='\0';

   /*
    * Attempt to open the file of ASCII lightning strikes...exit if error on open.
    */
   printf("strikes_file is %s\n",strikes_file);
   fp = fopen( strikes_file, "r" );
   if (fp == NULL ) 
   {
      fprintf (stderr, "get_density: Error opening %s exiting ltng_density\n",strikes_file);
      exit(1);  
   }

   /*
    * Count lightning strikes at gridpoints 
    */
   while (fscanf(fp,"%d %d %d %d %d %f %f %f %f\n", &year, &month, &day, &hour, &minute, &second, &lat, &lon, &strength) != EOF)
   {

      /*
       * Reject strikes that are not within the geographic area
       * of the grid. 
       */
      if ( lat < -25.0 || lat > 80.0 ) continue;
      if ( lon > 0.0 && lon < 110.0 ) continue;

      /*
       * Get the floating point grid indexes into the grid array
       * for this strike.
       */
      gtrans_(mapco, gridco, &one, &lat, &lon,
             &rgridlondex, &rgridlatdex, &iret,
             strlen(mapco), strlen(gridco) );

      /*
       * Get the grid indexes for longitude and latitude
       */
      gridlondex = rgridlondex;
      gridlatdex = rgridlatdex;

      /*
       * Accumulate strikes at this gridpoint 
       */
      density_grid[gridlatdex][gridlondex] += 1.0;

   }

   /*
    * Close the lightning strikes file
    */
   fclose(fp);

  /*
   * Calculate the lightning strike densities
   */
   for ( i = 0; i < *ky; i++ ) 
   for ( j = 0; j < *kx; j++ ) 
      if ( density_grid[i][j] != 0.0 ) {
         density_grid[i][j] /= space_res;
         density_grid[i][j] /= time_res;
      }
       
}
