#!/bin/sh

#  Set N-AWIPS development specific paths.
#
for adir in $GEMMAPS/programs ; do
    if ! echo "$PATH" | /bin/egrep -q "(^|:)${adir}($|:)" ; then
	export PATH=${PATH}:${adir}
    fi  
done

#========================================================================
# Alias set up

umask 022

alias la="ls -a --color=auto"
alias lla="ls -la --color=auto"
alias LL="ls -lL --color=auto"

alias x="chmod +x"

alias ccompile='$CC $CFLAGS'
alias fcompile='$FC $FFLAGS'

alias fd='find . -type d -print | more'
alias ff='find . -type f -print | more'
alias fk='find . -type f -print | grep gempak | more'
alias fr='find . -type f -print | grep extlibs | more'
alias fn='find . -newer \!* -type f -print'

alias gb='cd $GEMPAK/build'
alias ge='cd $GEMERR'
alias gf='cd $GEMPDF'
alias gh='cd $GEMHLP'
alias gi='cd $GEMINC'
alias gm='cd $GEMMAPS'
alias gp='cd $GEMPARM'
alias gt='cd $GEMTBL'
alias na='cd $NAWIPS'

alias h="history -h"

alias lb='ll -rt --color=auto $OS_BIN'
alias library='$AR $ARFLAGS'
alias ls="ls -CF --color=auto"
alias ll="ls -l --color=auto"

alias mkdir="mkdir -p"

#
#  Set convenience environmental variables for N-AWIPS developers.
#
export NCOLOR=$GEMPAK/source/programs/gui/ncolor
export NFAX=$GEMPAK/source/programs/gui/nfax
export NMAP=$GEMPAK/source/programs/gui/nmap2
export NSHARP=$GEMPAK/source/programs/gui/nsharp
export NTL=$GEMPAK/source/programs/gui/ntl
export NTRANS=$GEMPAK/source/programs/gui/ntrans
export NWX=$GEMPAK/source/programs/gui/nwx
export NXM=$GEMPAK/source/nxmlib

export PS1="`whoami`@`hostname|cut -d. -f1`$ "
