$(BINDIR)/gdgsfc_nc: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o -lgdgsfc \
		     -lsflib -ldiaglib -lgridlib -lgemlib \
		     -lgplt -ldevice -lnc -lgemlib -lcgemlib -lgn \
		     -ltextlib -lgridlib $(PYLIB) -lxslt -lxml2 -liconv -lz -lm
