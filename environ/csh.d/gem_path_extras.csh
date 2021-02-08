#!/bin/csh

# Add other useful system directories to the PATH

switch ( $OS )
    case "Linux":
	# No additional path directories
	breaksw

    case "AIX":
    	foreach adir ( /usr/vac/bin /usr/ucb )
	  if  ( -d ${adir} )  then
	    echo $PATH | egrep -i '(^|:)'${adir}'(:|$)' >& /dev/null
	    if ( $status != 0 ) then
	      set path = ( ${path} ${adir} )
	    endif
	  endif
	end
	breaksw

    case "HPUX":
    	foreach adir ( /usr/contrib/bin/X11 /usr/contrib/bin /opt/imake/bin )
	  if  ( -d ${adir} )  then
	    echo $PATH | egrep -i '(^|:)'${adir}'(:|$)' >& /dev/null
	    if ( $status != 0 ) then
	      set path = ( ${path} ${adir} )
	    endif
	  endif
	end
	breaksw

    case "IRIX":
    	foreach adir ( /usr/bsd )
	  if  ( -d ${adir} )  then
	    echo $PATH | egrep -i '(^|:)'${adir}'(:|$)' >& /dev/null
	    if ( $status != 0 ) then
	      set path = ( ${path} ${adir} )
	    endif
	  endif
	end
	breaksw

    case "SunOS":
    	foreach adir ( /usr/ccs/bin /usr/ucb /usr/openwin/bin )
	  if  ( -d ${adir} )  then
	    echo $PATH | egrep -i '(^|:)'${adir}'(:|$)' >& /dev/null
	    if ( $status != 0 ) then
	      set path = ( ${path} ${adir} )
	    endif
	  endif
	end
	breaksw

    default:
	echo
	echo "WARNING..."
	echo
	echo "The additional path has not been set properly."
	echo
	breaksw

endsw
