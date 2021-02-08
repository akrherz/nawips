$(BINDIR)/gdstream: -lgdstream -ldiaglib -lgemlib -lprmcnvlib -lgridlib \
		    -lgemlib -lappl -lsyslib -lcgemlib -lnetcdf \
		    -ltextlib $(PYLIB) -lxslt -lxml2 -liconv -lbz2 \
	            -lhdf5_hl -lhdf5 -lz -ldl -lm
