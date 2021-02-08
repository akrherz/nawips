#include "gen_ltng_ascii.h"

/********************************************************************************
 * gen_ltng_ascii.c                                                             *
 *                                                                              *
 * CONTENTS                                                                     *
 * gen_ltng_ascii.c                                                             *
 *******************************************************************************/

int main ( int argc, char *argv[] ) 
/********************************************************************************
 * gen_ltng_ascii.c                                                             *
 *                                                                              *
 * This function gets McIDAS lightning strike data from a McIDAS longword file  *
 * and generates an ASCII equivalent of this file.                              *
 * The ASCII file is known as "the n-minute file", because it contains          *
 * n minutes' worth of data.                                                    *
 *                                                                              *
 * Arguements                                                                   *
 *                                                                              *
 *     year - four digit year of lightning strike data                          *
 *    month - two digit month of lightning strike data                          *
 *      day - two digit day of lightning strike data                            *
 *     hour - two digit hour of lightning strike data                           *
 *   minute - two digit minute of lightning strike data                         *
 * num_mins - number of minutes in the ASCII lightning strike data file,        *
 *            counting backward in time from the date/time formed by            *
 *            the other arguements.                                             *
 **                                                                             *
 * Log:                                                                         *
 * G. McFadden/IMSG   12/12                                                     *
 *                                                                              *
 *******************************************************************************/
{

   char lightning_files[N_MCIDAS][16];

   char syear[]="2012";
   char smonth[]="11";
   char sday[]="15";
   char shour[]="05";

   char *ascii_nmin;
   char n_minute_file[18];
   char copy_com[31] = "cp $OBS/ltng/yyyymmddhh.ltng .";
   char copy_com_prefix[] = "cp $OBS/ltng/";

   char tm_month[3], tm_day[3], tm_hour[3], tm_minute[3];

   int year, month, day, hour, minute;
   int time_arrays[MAX_MINUTES][5];
   int file_arrays[N_MCIDAS][4];
   int minutes_to_use[N_MCIDAS][60];
   int num_min_this_hour[N_MCIDAS];
   int iret, one = 1;
   int num_files = 1, num_mins;
   int i,j,m;

/*-------------------------------------------------------------------------------------*/

   /*
    *   Get the arguements with which this program was invoked.
    */
   year     = atoi(argv[1]);
   month    = atoi(argv[2]);
   day      = atoi(argv[3]);
   hour     = atoi(argv[4]);
   minute   = atoi(argv[5]);
   num_mins = atoi(argv[6]);

   /*
    *   Initialize some variables.
    */
   for ( i = 0; i < N_MCIDAS; i++ )
      lightning_files[i][0] = '\0'; 

   for ( i = 0; i < N_MCIDAS; i++ )
   for ( j = 0; j < 60; j++ )
      minutes_to_use[i][j] = 0; 

   for ( i = 0; i < N_MCIDAS; i++ )
      num_min_this_hour[i] = 0; 

   /*
    *   Load the date and time of the run into an array.
    */
   time_arrays[0][0] = year;
   time_arrays[0][1] = month;
   time_arrays[0][2] = day;
   time_arrays[0][3] = hour;
   time_arrays[0][4] = minute;
   printf("The date/time of this run is %d %d %d %d %d\n",time_arrays[0][0], time_arrays[0][1], time_arrays[0][2], time_arrays[0][3], time_arrays[0][4]);

   /*
    *   Get the date and time of the first minute that will be represented
    *   in the ASCII file.
    */
 /*ti_subm_(time_arrays[0],&one,&time_arrays[0],&iret);*/
   minutes_to_use[0][0] = time_arrays[0][4];
   printf("The date/time of minute %d is %d %d %d %d %d\n", 1 , time_arrays[0][0], time_arrays[0][1], 
                                                                time_arrays[0][2], time_arrays[0][3], time_arrays[0][4]);
   /*
    *   Get the year/month/day/hour of the first McIDAS lightning file.
    */
   file_arrays[0][0] = time_arrays[0][0];
   file_arrays[0][1] = time_arrays[0][1];
   file_arrays[0][2] = time_arrays[0][2];
   file_arrays[0][3] = time_arrays[0][3];

   /*
    *   Get the dates and times of the succeeding minute(s) that will be represented
    *   in the ASCII file, if any...also remember which minutes for each hour and the
    *   roots of the names of the hourly McIDAS files that will be represented in the
    *   ASCII file...also, remember how many minutes of each hour will be represented.
    */
   m = 1;
   num_min_this_hour[0] = m;

   for ( i = 1; i < num_mins; i++ ) {

      j = i - 1;
      ti_subm_(time_arrays[j],&one,time_arrays[i],&iret);

      if ( ! ( time_arrays[j][0] == time_arrays[i][0] &&
               time_arrays[j][1] == time_arrays[i][1] &&
               time_arrays[j][2] == time_arrays[i][2] &&
               time_arrays[j][3] == time_arrays[i][3] ) ) {
         file_arrays[num_files][0] = time_arrays[i][0];
         file_arrays[num_files][1] = time_arrays[i][1];
         file_arrays[num_files][2] = time_arrays[i][2];
         file_arrays[num_files][3] = time_arrays[i][3];
         num_files++;
         m = 0;
      }

      minutes_to_use[num_files-1][m++] = time_arrays[i][4];
      num_min_this_hour[num_files-1] = m;

      printf("The date/time of minute %d is %d %d %d %d %d\n", i+1 , time_arrays[i][0], time_arrays[i][1], 
                                                                     time_arrays[i][2], time_arrays[i][3], time_arrays[i][4]);
   }

   /*
    *   Construct the filename of the ASCII n-minute file.
    */
   n_minute_file[0] = '\0';
   strcat( n_minute_file, argv[1] );

   sprintf( tm_month, "%2.2d", month );
   strcat( n_minute_file, tm_month );

   sprintf( tm_day, "%2.2d", day );
   strcat( n_minute_file, tm_day );

   sprintf( tm_hour, "%2.2d", hour );
   strcat( n_minute_file, tm_hour );

   sprintf( tm_minute, "%2.2d", minute );
   strcat( n_minute_file, tm_minute );

   ascii_nmin = argv[6];
   strcat( n_minute_file, "." );
   strcat( n_minute_file, ascii_nmin );
   printf("n_minute_file  %s\n",n_minute_file);

   for ( i = 0; i < num_files; i++ ) {

   /*
    *  Construct the shell command string that copies the 
    *  McIDAS lightning file for this hour.
    *  After the command string has been contstructed, 
    *  have the shell execute the command and copy the
    *  lightning file over from the $OBS directory.
    */

      copy_com[0] = '\0';
      strcat(copy_com,copy_com_prefix);
      printf("copy_com is %s\n",copy_com);
      sprintf(syear, "%4.4d", file_arrays[i][0]);
      strcat(copy_com,syear);
      sprintf(smonth, "%2.2d", file_arrays[i][1]);
      strcat(copy_com,smonth);
      sprintf(sday, "%2.2d", file_arrays[i][2]);
      strcat(copy_com,sday);
      sprintf(shour, "%2.2d", file_arrays[i][3]);
      strcat(copy_com,shour);
      strcat(copy_com,".ltng .");
      printf("copy_com is %s\n",copy_com);
      iret = system(copy_com);

   /*
    *   Remember the filename of the McIDAS
    *   lightning file for this hour.
    */
      lightning_files[i][0] = '\0';
      strcat(lightning_files[i],syear);
      strcat(lightning_files[i],smonth);
      strcat(lightning_files[i],sday);
      strcat(lightning_files[i],shour);
      strcat(lightning_files[i],".ltng");

   }

   /*
    *  Call the function that actually reads the McIDAS lightning strike file(s)
    *  and writes out the data to the ASCII n-minute file.
    */
   printf ("num_mins is %d\n",num_mins);
   printf ("num_files is %d\n",num_files);

   for ( i = 0; i < N_MCIDAS; i++ )
      printf("lf %d is %s\n",i,lightning_files[i]); 

   for ( i = 0; i < N_MCIDAS; i++ )
   for ( j = 0; j < 60; j++ )
      printf("mtu %d %d is %d\n", i,j,minutes_to_use[i][j]); 

   for ( i = 0; i < N_MCIDAS; i++ )
      printf("nmtu hour %d is %d\n",i+1,num_min_this_hour[i]); 

   printf("n_minute_file  %s\n",n_minute_file);

   read_lghtng_strikes_nmin ( num_mins, num_files, lightning_files, minutes_to_use, num_min_this_hour, n_minute_file );

}
