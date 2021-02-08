$(BINDIR)/gdvint: $(OS_LIB)/ginitp_alt.o -lgdvint -ldiaglib \
		     -lgridlib -lgemlib -lgplt -ldevice -lgn \
		     -lgemlib -lcgemlib -lm \
		     -ltextlib -lgridlib -lgemlib $(PYLIB) -lxslt -lxml2 -liconv -lz
