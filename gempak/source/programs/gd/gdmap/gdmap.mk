$(BINDIR)/gdmap: -lgdmap -ldiaglib -lgemlib -lprmcnvlib -lgridlib -lcgemlib \
		 -lgemlib -lappl -lcgemlib -lsyslib -lm -lnetcdf \
		  -ltextlib $(PYLIB) -lxslt -lxml2 -liconv -lz -lbz2 \
	          -lhdf5 -lhdf5_hl  \
	          $(OS_LIB)/libhdf5_hl.so
