$(BINDIR)/gdplot3: -lgdplot3 -lgdstream -lgdmap -lsfmap -ldiaglib \
		   -lgemlib -lprmcnvlib -lgridlib -lgemlib -lcgemlib \
		   -lappl -lsyslib -lnetcdf $(PYLIB) \
		   -ltextlib -lxslt -lxml2 -liconv -lz -lm -lbz2 \
	           -lhdf5 -lhdf5_hl  \
	           $(OS_LIB)/libhdf5_hl.so
