$(BINDIR)/testlc: -lgemlib -lgridlib -lgemlib -lcgemlib \
		  -ltextlib -lxslt -lxml2 -liconv $(PYLIB) \
		  -lappl -lsyslib -lnetcdf -lz -lm -lbz2 \
	          -lhdf5 -lhdf5_hl  \
	          $(OS_LIB)/libhdf5_hl.so
