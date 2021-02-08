$(BINDIR)/oabsfc: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o -loabsfc \
		  -lprmcnvlib -loalib -ldiaglib -lgemlib -lsflib \
		  -lgridlib -lgplt -ldevice -lcgemlib -lgplt \
		  -ldevice -lcgemlib -lgemlib -lgn -lgemlib \
		  -ltextlib -lgridlib $(PYLIB) -lxslt -lxml2 -liconv -lz -lm
