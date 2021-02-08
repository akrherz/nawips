$(BINDIR)/goftxt: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o -lgoftxt \
		  -lprmcnvlib -ldiaglib -lgridlib -lcgemlib -lgemlib \
		  -lgplt -ldevice -lgn -lgplt -lcgemlib -lgemlib -lm \
		  -ltextlib -lgridlib $(PYLIB) -lxslt -lxml2 -liconv -lz
