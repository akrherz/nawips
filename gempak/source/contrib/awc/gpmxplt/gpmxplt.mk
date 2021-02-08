$(BINDIR)/gpmxplt: -lgpmxplt -lcgemlib -lgemlib -lprmcnvlib -lgridlib \
		  -lappl -lgemlib -ltextlib -lxslt -lxml2 -liconv \
		  -lsyslib -lnetcdf -lz -lm -lbz2 -lhdf5 -lhdf5_hl  \
	          $(OS_LIB)/libhdf5_hl.so
