$(BINDIR)/gdgsfc: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o -lgdgsfc \
		  -lsflib -ldiaglib -lgridlib -lgemlib -lgplt -ldevice \
		  -lgn -lgplt -lcgemlib -lgemlib \
		  -ltextlib -lgridlib $(PYLIB) -lxslt -lxml2 -liconv -lz -lm
