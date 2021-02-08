$(BINDIR)/gptcww: -lgptcww -lcgemlib -lprmcnvlib -lgemlib \
		  -lappl -lgemlib -lgridlib -lsyslib -lnetcdf $(PYLIB) \
		  -ltextlib -lxslt -lxml2 -liconv -lz -lm -lbz2 \
	          -lhdf5 -lhdf5_hl  \
	          $(OS_LIB)/libhdf5_hl.so 
