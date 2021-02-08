#!/bin/sh
############################################################################
#
#  gemenv.sh 
#
#  This source file sets up the N-AWIPS environment.
#
##
# Log:
# T. Piper/SAIC		01/08	Created from .profile
# T. Piper/SAIC         11/07   HP only:  Added -lXp and -lXext to XLIBS
# T. Piper/SAIC         11/07   All:  Moved $OS_BIN to the head of $PATH
# S. Jacobs/NCEP        12/07   Added options for GCC4/GFORTRAN
# T. Piper/SAIC         01/08   Removed $OS_LIB/<>.a environment variables
# T. Piper/SAIC         01/08   Removed GEMEXE and GEMOLB
# T. Piper/SAIC         03/08   Modified NA_OS to include word size on Linux
# S. Jacobs/NCEP	08/09	Added OS_BLD for identifying RHEL 5
# S. Jacobs/NCEP	03/12	Cleaned up setting NA_OS for all platforms
# S. Jacobs/NCEP	11/12	Separated into individual files
############################################################################
#
#  IMPORTANT:  The system environment variable NAWIPS must be
#		set in the site's .profile startup file.
#
#========================================================================

# Set the OS values
. $NAWIPS/environ/bash.d/gem_set_os.sh

# If the OS is not set properly, do not try any of the other setup
if [ $? == 0 ] ; then
    # Set GEMPAK environment variables
    . $NAWIPS/environ/bash.d/gem_env_vars.sh

    # Add to the path, depending on the OS
    . $NAWIPS/environ/bash.d/gem_path_extras.sh

    # Set X/Motif search paths
    . $NAWIPS/environ/bash.d/gem_motif_path.sh

    # Add Python, if the AWIPS installation exists
    . $NAWIPS/environ/bash.d/gem_awips_python.sh

    # Add the main GEMPAK directories to the path
    . $NAWIPS/environ/bash.d/gem_path.sh

    # Set compilation and link flags for C and FORTRAN
    . $NAWIPS/environ/bash.d/gem_build_vars.sh

    # Set printer variables
    . $NAWIPS/environ/bash.d/gem_printers.sh

    # Set the X Display
    . $NAWIPS/environ/bash.d/gem_x_display.sh
fi
