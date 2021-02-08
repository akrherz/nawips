$(BINDIR)/gdgrib_nc: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o \
		     -lgdgrib -lgdcfil -ldiaglib -lgridlib -lgemlib \
		     -lgplt -ldevice -lnc -lgemlib -lcgemlib -lgn \
		     -ltextlib $(PYLIB) -lxslt -lxml2 -liconv -lz -lm
