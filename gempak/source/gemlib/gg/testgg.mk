$(BINDIR)/testgg: -lgemlib -lvflib -lprmcnvlib -lgridlib -ltextlib -lcgemlib \
		  -lappl -lgemlib -ltextlib -lxslt -lxml2 -liconv -lz \
		  -lsyslib -lGPC -lnetcdf -lz -lm -lbz2 -lhdf5 -lhdf5_hl  \
	          $(OS_LIB)/libhdf5_hl.so
