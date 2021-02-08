$(BINDIR)/gdfrzl: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o -lgdfrzl \
		  -lgdcntr -ldiaglib -lgemlib -lprmcnvlib -lgridlib \
		  -lgplt -ldevice -lvg -lgn -lcgemlib -lgemlib -lgplt \
		  -ldevice -lcgemlib -lvg -lm -lnetcdf \
		  -ltextlib $(PYLIB) -lxslt -lxml2 -liconv -lz -lbz2 \
	          -lhdf5 -lhdf5_hl  \
	           $(OS_LIB)/libhdf5_hl.so
