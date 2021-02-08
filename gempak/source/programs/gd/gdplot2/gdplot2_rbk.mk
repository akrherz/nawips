$(BINDIR)/gdplot2_rbk: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o \
		       -lgdplot2 -lgdstream -lgdmap -lsfmap -ldiaglib \
		       -lgemlib -lprmcnvlib -lgridlib -lgplt -ldevice \
		       -lrbk -lcgemlib -lgemlib -lgn -lnetcdf $(PYLIB) \
		       -ltextlib -lxslt -lxml2 -liconv -lz -lm -lbz2 \
	               -lhdf5 -lhdf5_hl  \
	               $(OS_LIB)/libhdf5_hl.so
