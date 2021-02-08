$(BINDIR)/oabsnd: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o -loabsnd \
		  -loalib -lsnlib -ldiaglib -lgemlib -lprmcnvlib -lgridlib \
		  -lcgemlib -lgplt -ldevice -lcgemlib -lgemlib -lgplt \
		  -ldevice -lgn -lgemlib \
		  -ltextlib -lgridlib $(PYLIB) -lxslt -lxml2 -liconv -lz -lm
