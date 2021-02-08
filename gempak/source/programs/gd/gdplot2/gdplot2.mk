$(BINDIR)/gdplot2: -lgdplot2 -lgdstream -lgdmap -lsfmap -ldiaglib \
		   -lgemlib -lprmcnvlib -lgridlib -lcgemlib -lgemlib \
		   -lappl -lsyslib -lnetcdf $(PYLIB) \
		   -ltextlib -lxslt -lxml2 -liconv -lbz2 \
	           -lhdf5_hl -lhdf5 -lz -ldl -lm
