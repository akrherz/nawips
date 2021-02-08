$(BINDIR)/gdprof_nc: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o -lgdprof \
		     -lprmcnvlib -ldiaglib -lgemlib -lgridlib -lcgemlib -lgplt \
		     -ldevice -lnc -lgn -lcgemlib -lgridlib -lgemlib -lm \
		     -ltextlib $(PYLIB) -lxslt -lxml2 -liconv -lz
