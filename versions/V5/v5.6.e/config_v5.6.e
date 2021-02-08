              NAWIPS 5.6  Configuration Changes Description Log

c1.	Added a log entry to each of the configuration dot files
        for NAWIPS. Created a new log for recording changes to the
	configuration dot files.
	Removed "-fullwarn" and "-C" from the IRIX5 compile flags.
	Done, SJ, (SS), 4/10/01.

	.cshrc, .cshrc_data, .cshrc.user, .profile, .profile_data,
	.login, .login.user

	NEW:	versions/config.log

c2.	Added a comment line ( /* ARGSUSED */ ) before X-windows callback
	functions to eliminate "false" warnings from lint.  Done, TP, (DP),
	4/20/01.

	All callback functions are affected, which are found in gui routines
	including all NPROGS functions, nmap2, and nmaplib.

=============================  End of Patch 5.6.d  =============================
c3.	Updated the location of $SPDATA variable for ATCF data access.
	This change only applies to the World Weather Building.  Done, DK,
	(SJ), 5/31/01.

	.cshrc_data

 =============================  End of Patch 5.6.d.1  =======================

 c4.	Added MISC_DATA to the list of data locations. This environment
	variable is used to access the QuikScat and other data.  Added +DA1.1
	to the HPUX10 compile flags.  Done, SJ, (ES), 7/26/01

	.cshrc_data, .profile_data, .cshrc, .profile

c5.	Update configuration files to support HPUX11 OS.  Done, TP, (SJ), 
	8/13/01.

	.cshrc, .profile


