#!/bin/csh

# Add the GEMPAK directories to the PATH

# Prepend directories in reverse order
foreach adir ( ${OS_BIN} . )
    if  ( -d ${adir} )  then
	echo $PATH | egrep -i '(^|:)'${adir}'(:|$)' >& /dev/null
	if ( $status != 0 ) then
	    set path = ( ${adir} ${path} )
	endif
    endif
end

# Append more directories
foreach adir ( $NAWIPS/bin \
		$NAWIPS/scripts/ez \
		$NAWIPS/scripts/nawips \
		$NAWIPS/scripts/prnt \
		$NAWIPS/scripts/decoder )
    if  ( -d ${adir} )  then
	echo $PATH | egrep -i '(^|:)'${adir}'(:|$)' >& /dev/null
	if ( $status != 0 ) then
	    set path = ( ${path} ${adir} )
	endif
    endif
end

