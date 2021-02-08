$(BINDIR)/gdwind: -lgdwind -ldiaglib -lgemlib -lcgemlib -lprmcnvlib \
		  -lgridlib -lgemlib -lappl -lsyslib -lnetcdf \
		  -ltextlib $(PYLIB) -lxslt -lxml2 -liconv -lbz2 \
	          -lhdf5_hl -lhdf5 -lz -ldl -lm
