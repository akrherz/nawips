$(BINDIR)/gddiag: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o -lgddiag \
		  -lgdcfil -ldiaglib -lgridlib -lgemlib -lgplt \
		  -ldevice -lnc -lgn -lgemlib -lcgemlib -lsyslib \
		  -ltextlib $(PYLIB) -lxslt -lxml2 -liconv -lz -lm
