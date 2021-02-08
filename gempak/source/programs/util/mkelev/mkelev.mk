$(BINDIR)/mkelev: $(LIBDIR)/ginitp_alt.o $(LIBDIR)/gendp_alt.o -lmkelev \
		  -lgdcntr -ldiaglib -lgemlib -lprmcnvlib -lgridlib -lgplt \
		  -ldevice -lvg -lcgemlib -lgn -lgemlib -lnetcdf \
		  -ltextlib $(PYLIB) -lxslt -lxml2 -liconv -lbz2 \
	          -lhdf5_hl -lhdf5 -lz -ldl -lm
