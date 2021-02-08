$(BINDIR)/gdgrib: $(OS_LIB)/ginitp_alt.o -lgdgrib -lgdcfil -ldiaglib \
		  -lgridlib -lgemlib -lgplt -ldevice -lgn -lgplt \
		  -lcgemlib -lgemlib -ltextlib $(PYLIB) -lxslt -lxml2 -liconv -lz -lm
