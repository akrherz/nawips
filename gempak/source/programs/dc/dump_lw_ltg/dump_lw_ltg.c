#include "no_xm_geminc.h"
#include <netinet/in.h>

#define MCIDAS_MISSING 0x80808080

static void
read_strike_from_LW(
    FILE    *file,
    int     *delta,
    int     *ilat,
    int     *ilon,
    int     *kamps
) {
    unsigned int    intmp;

    /*
     * Ok, a LW entry is the following:
     *  1) The seconds and deciseconds of the strike, offset
     *     from the reference minute, packed into an int
     *  2) The latitude packed into an int (which is why we
     *     are passing the lat around as an int)
     *  3) The longitiude packed into an int (which is why we
     *     are passing the longitude around as an int)
     *  4) The strike's intensity (the kamps) as an int
     */
    fread(&intmp, sizeof(int), 1, file);
    *delta = ntohl(intmp);
    fread(&intmp, sizeof(int), 1, file);
    *ilat = ntohl(intmp);
    fread(&intmp, sizeof(int), 1, file);
    *ilon = ntohl(intmp);
    fread(&intmp, sizeof(int), 1, file);
    *kamps= ntohl(intmp);
}

int
main (
    int     argc,
    char    *argv[]
) {
    FILE        *file;
    int         intmp;
    int         yyyyjjj;
    int         hhmm;
    int         old_fmt;
    int         offset;
    int         bucket;
    int         last_filled;
    unsigned int         file_offset[60];
    struct tm   file_time;
    time_t      reference_time;
    int         delta;
    int         ilat;
    int         ilon;
    int         kamps;
    int         strike;

    if (argc < 2) {
        fprintf(stderr, "Need file name to read for dumping\n");
        exit(-1);
    }

    file = fopen(argv[1], "r");
    if (!file) {
        fprintf(stderr, "Could not open %s for reading\n", argv[1]);
        exit(-1);
    }

    if (argc == 3 && strcmp(argv[2], "-o") == 0) {
        old_fmt = 1;
    } else {
        old_fmt = 0;
    }

    /* 
     * The header is 60 words of offsets, one for each minute in
     * the file followed by 3 words for the year/day, last
     * filled, and hour/minute.
     */

    /*
     * Get the offset info
     */
    for (offset=0; offset < 60; offset++) {
        fread(&intmp, sizeof(int), 1, file);
        file_offset[offset] = ntohl(intmp);
        if (file_offset[offset] != MCIDAS_MISSING) {
            file_offset[offset] *= 4;
        }
    }

    /*
     * The next three entries of the file are the
     *  1) 4 digit year and julian day of data, packed into an int
     *     (note, the Unix time value of julian day numbers from 0, McIDAS numbers from 1)
     *  2) Index of last entry with data, in an int 
     *  3) Hour and minute of start of data in the file, packed into an int
     *     (Old format has this as the total number of strikes in the file)
     */

    fread(&intmp, sizeof(int), 1, file);
    yyyyjjj = ntohl(intmp);
    fread(&intmp, sizeof(int), 1, file);
    last_filled = ntohl(intmp);
    fread(&intmp, sizeof(int), 1, file);
    hhmm = ntohl(intmp);

    memset(&file_time, 0, sizeof(struct tm));
    if (old_fmt) {
        file_time.tm_min  = 0;
        file_time.tm_hour = 0;
    } else {
        file_time.tm_min  = hhmm % 100;
        file_time.tm_hour = hhmm / 100;
    }
    file_time.tm_year = yyyyjjj/1000 - 1900;
    file_time.tm_yday = yyyyjjj % 1000 - 1;
    reference_time = mktime(&file_time);
    reference_time += (yyyyjjj % 1000) * 86400;

    printf("Reference time %s", ctime(&reference_time));

    for (bucket = 0; bucket <= last_filled; bucket++) {
        if (file_offset[bucket] != MCIDAS_MISSING) {
            fseek(file, file_offset[bucket], SEEK_SET);
            /* Get the number of strikes for this entry */
            fread(&intmp, sizeof(int), 1, file);
            intmp = ntohl(intmp);

            for (strike = 0; strike < intmp; strike++) {
                read_strike_from_LW(
                        file,
                        &delta, 
                        &ilat, 
                        &ilon, 
                        &kamps 
                    );
                printf("Minute %2d Sec_off %2d Millisec %2d Ilat %7d Ilon %8d Kamps %3d\n",
                        bucket, delta/100, delta%100, ilat, ilon, kamps);
            }
        }
    }
    return (0);
}
