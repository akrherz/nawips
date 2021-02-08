#  Set N-AWIPS development specific paths.
#
foreach adir ( $GEMMAPS/programs )
    if  ( -d ${adir} )  then
    	echo $PATH | egrep -i '(^|:)'${adir}'(:|$)' >& /dev/null
	if ( $status != 0 ) then
	    set path = ( ${path} ${adir} )
	endif
    endif
end
#
#  Set convenience aliases for N-AWIPS developers.
#
source /export-1/cdbsrv/cdbutl/.aliases

alias a		"alias"
alias ua	"unalias"

alias x		"chmod +x"
alias addwrite	'find . ! -perm -200 -exec chmod u+w {} \;'
alias protect	'chmod -R o-rwx *'
alias unprotect	'find . -perm -700 -exec chmod o+rx {} \; ; find . -perm -400 -exec chmod o+r {} \;'

alias ccompile	'$CC $CFLAGS'
alias fcompile	'$FC $FFLAGS'

alias cd	'cd \!*;echo $cwd'
alias go	'cd "$@";pwd'

alias fd	'find . -type d -print | more'
alias ff	'find . -type f -print | more'
alias fk	'find . -type f -print | grep gempak | more'
alias fr	'find . -type f -print | grep extlibs | more'
alias fn	'find . -newer \!* -type f -print'

alias gb	'cd $GEMPAK/build'
alias ge	'cd $GEMERR'
alias gf	'cd $GEMPDF'
alias gh	'cd $GEMHLP'
alias gi	'cd $GEMINC'
alias gm	'cd $GEMMAPS'
alias gp	'cd $GEMPARM'
alias gt	'cd $GEMTBL'
alias na	'cd $NAWIPS'

alias h		"history -h"

alias la	"ls -a --color=auto"
alias lb	'll -rt --color=auto $OS_BIN'
alias library	'$AR $ARFLAGS'
alias ls	"ls -CF --color=auto"
alias ll	"ls -l --color=auto"

alias mkdir	"mkdir -p"

alias sd	'setenv DISPLAY \!$\:0'
alias st	'setenv TERM xterm'

if  ( $NPRINTER != "" )  then
    alias print	$LP $LPFLAG$NPRINTER
else
    alias print	$LP
endif

#
#  Set convenience environmental variables for N-AWIPS developers.
#
setenv NCOLOR   $GEMPAK/source/programs/gui/ncolor
setenv NFAX     $GEMPAK/source/programs/gui/nfax
setenv NMAP     $GEMPAK/source/programs/gui/nmap2
setenv NSHARP   $GEMPAK/source/programs/gui/nsharp
setenv NTL      $GEMPAK/source/programs/gui/ntl
setenv NTRANS   $GEMPAK/source/programs/gui/ntrans
setenv NWX      $GEMPAK/source/programs/gui/nwx
setenv NXM      $GEMPAK/source/nxmlib

#
#  Do not create core dump files when a program blows up.
#
limit coredumpsize 0

#
#  Set default permissions for newly created files.
#
umask 022

#
#========================================================================
#  Skip remaining setup if not an interactive shell.
 
if ($?prompt == 0) exit
if ($?USER == 0) exit
#  Set the interrupt character to Ctrl-c and do clean backspacing.
switch ( $OS )
    case "AIX":
#  IBM
#	stty echoe erase "^H" intr "^C"
	breaksw
    case "HPUX":
#  Hewlett-Packard
#	stty echoe erase "^H" intr "^C"
#	stty kill "^U" eof "^D" susp "^Z" hupcl ixon ixoff tostop
	breaksw
    case "IRIX":
#  Silicon Graphics
#	stty echoe erase "^?" intr "^C"
	breaksw
    case "Linux":
#  Linux - PC
#	stty echoe erase "^H" intr "^C"
	breaksw
    case "SunOS":
#  Sun Micro Systems
#	stty echoe erase "^H" intr "^C"
	breaksw
    default:
	echo
	echo "WARNING..."
	echo
	echo "The erase command has not been set properly."
	echo
	breaksw
endsw

#
#  Set the prompt.
#
set prompt="`whoami`@`hostname|cut -d. -f1`> "

#
#  Tells the shell to ignore .o files when trying to complete filenames
#  when filec is set.  (This does not hold if the .o file is the only
#  one that could be completed.)
set fignore=.o
#  Tells "filec" not to cry if it cannot complete a file.
set nobeep
#  Notify me when the status of background jobs change
set notify
#  Substitute the filename to be completed when
#  an <ESC> is typed at the command line.
set filec
#  Remember xxx most recent events.
set history=150
#  Save the most recent xxx events after log out.
set savehist=150
set ignoreeof
