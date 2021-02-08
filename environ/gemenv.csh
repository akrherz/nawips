#!/bin/csh
############################################################################
#
#  gemenv.csh
#
#  This source file sets up the N-AWIPS environment.
#
##
# Log:
# T. Piper/SAIC		01/08	Created from .cshrc
# T. Piper/SAIC		11/07	HP only:  Added -lXp and -lXext to XLIBS
# T. Piper/SAIC		11/07	All:  Moved $OS_BIN to the head of $path
# S. Jacobs/NCEP	12/07	Added options for GCC4/GFORTRAN
# T. Piper/SAIC		01/08	Removed $OS_LIB/<>.a environment variables
# T. Piper/SAIC		01/08	Removed GEMEXE and GEMOLB
# T. Piper/SAIC		03/08	Modified NA_OS to include word size on Linux
# S. Jacobs/NCEP	08/09	Added OS_BLD for identifying RHEL 5
# S. Jacobs/NCEP	03/12	Cleaned up setting NA_OS for all platforms
# S. Jacobs/NCEP	11/12	Separated into individual files
############################################################################
#
#  IMPORTANT:  The system environment variable NAWIPS must be
#		set in the site's .cshrc startup file.
#
#========================================================================

# Set the OS values
source $NAWIPS/environ/csh.d/gem_set_os.csh
# If the OS is not set properly, exit the script
if ( $status != 0 ) then
    exit
endif

# Set GEMPAK environment variables
source $NAWIPS/environ/csh.d/gem_env_vars.csh

# Add to the path, depending on the OS
source $NAWIPS/environ/csh.d/gem_path_extras.csh

# Set X/Motif search paths.
source $NAWIPS/environ/csh.d/gem_motif_path.csh

# Add Python, if the AWIPS2 installation exists
source $NAWIPS/environ/csh.d/gem_awips_python.csh

# Add the main GEMPAK directories to the path
source $NAWIPS/environ/csh.d/gem_path.csh

# Set compilation and link flags for C and FORTRAN
source $NAWIPS/environ/csh.d/gem_build_vars.csh

# Set printer variables
source $NAWIPS/environ/csh.d/gem_printers.csh
