$(BINDIR)/gdcntr: -lgdcntr -ldiaglib -lgemlib -lgridlib -lprmcnvlib -lgemlib \
		  -lcgemlib -lappl -lsyslib -lnetcdf $(PYLIB) \
		  -ltextlib -lxslt -lxml2 -liconv -lz -lm -lbz2 -lhdf5 -lhdf5_hl  \
	$(OS_LIB)/libhdf5_hl.so
