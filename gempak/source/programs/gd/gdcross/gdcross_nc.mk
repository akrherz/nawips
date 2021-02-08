$(BINDIR)/gdcross_nc: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o \
		   -lgdcross -ldiaglib -lgemlib -lgridlib \
		   -lgemlib -lcgemlib -lgplt -ldevice -lnc -lgn -lvg \
		   -lgemlib -lcgemlib -lsyslib $(PYLIB) \
		   -ltextlib -lxslt -lxml2 -liconv -lz -lm
