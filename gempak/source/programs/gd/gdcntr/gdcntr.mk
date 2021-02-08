$(BINDIR)/gdcntr: -lgdcntr -ldiaglib -lgemlib -lgridlib -lprmcnvlib -lgemlib \
		  -lcgemlib -lappl -lsyslib -lnetcdf $(PYLIB) \
		  -ltextlib -lxslt -lxml2 -liconv -lbz2 \
	          -lhdf5_hl -lhdf5 -lz -ldl -lm
