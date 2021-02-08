$(BINDIR)/nagrib_nc: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o \
		     -lnagrib -lgriblib -ldiaglib -lgridlib -lgemlib \
		     -lgplt -ldevice -lnc -lgn \
		     -ltextlib -lgemlib -lcgemlib \
		     $(PYLIB) -lxslt -lxml2 -liconv -lz -lm
