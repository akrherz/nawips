$(BINDIR)/gdfrzl: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o -lgdfrzl \
		  -lgdcntr -ldiaglib -lgemlib -lprmcnvlib -lgridlib \
		  -lgplt -ldevice -lvg -lgn -lcgemlib -lgemlib -lgplt \
		  -ldevice -lcgemlib -lvg -lnetcdf \
		  -ltextlib $(PYLIB) -lxslt -lxml2 -liconv -lbz2 \
	          -lhdf5_hl -lhdf5 -lz -ldl -lm
