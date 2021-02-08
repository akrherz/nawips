$(BINDIR)/gdgrib2: $(OS_LIB)/ginitp_alt.o -lgdgrib2 -lgriblib \
		   -ldiaglib -lgemlib -lgridlib -lcgemlib -lgemlib \
		   -lgplt -ldevice -lgn -lgplt -lcgemlib -lgemlib $(PYLIB) \
		   -ljasper -lpng -ltextlib -lxslt -lxml2 -liconv -lz -lm
