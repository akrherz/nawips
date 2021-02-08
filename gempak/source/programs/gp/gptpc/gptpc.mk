$(BINDIR)/gptpc: -lgptpc -lcgemlib -lprmcnvlib -lgemlib -lgridlib \
		 -lappl -lgemlib -lsyslib -lnetcdf \
		 -ltextlib -lxslt -lxml2 -liconv -lz -lm -lbz2 \
	         -lhdf5 -lhdf5_hl  \
	         $(OS_LIB)/libhdf5_hl.so
