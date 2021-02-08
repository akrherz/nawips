$(BINDIR)/gdwind: -lgdwind -ldiaglib -lgemlib -lcgemlib -lprmcnvlib \
		  -lgridlib -lgemlib -lappl -lsyslib -lnetcdf \
		  -ltextlib $(PYLIB) -lxslt -lxml2 -liconv -lz -lm -lbz2 \
	          -lhdf5 -lhdf5_hl  \
	          $(OS_LIB)/libhdf5_hl.so
