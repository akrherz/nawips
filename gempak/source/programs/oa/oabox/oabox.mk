$(BINDIR)/oabox: -loabox -lgemlib -lgridlib -lcgemlib -lappl -lgemlib \
		 -lcgemlib -lgemlib -lsyslib -lnetcdf \
		 -ltextlib $(PYLIB) -lxslt -lxml2 -liconv -lz -lm -lbz2 \
	         -lhdf5 -lhdf5_hl  \
	         $(OS_LIB)/libhdf5_hl.so
