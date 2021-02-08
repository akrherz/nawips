$(BINDIR)/gpanot: -lgpanot -lgemlib -lgridlib -lappl \
		  -lgemlib -ltextlib $(PYLIB) -lxslt -lxml2 -liconv \
		  -lsyslib -lm -lnetcdf -lz -lbz2 -lhdf5 -lhdf5_hl  \
	          $(OS_LIB)/libhdf5_hl.so 
