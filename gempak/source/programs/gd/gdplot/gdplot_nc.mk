$(BINDIR)/gdplot_nc: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o -lgdplot \
		     -ldiaglib -lgemlib -lprmcnvlib -lgridlib -lcgemlib -lgplt -ldevice \
		     -lnc -lgn -lcgemlib -lgemlib -lnetcdf \
		     -ltextlib $(PYLIB) -lxslt -lxml2 -liconv -lz -lm -lbz2 -lhdf5 -lhdf5_hl  \
	             $(OS_LIB)/libhdf5_hl.so
