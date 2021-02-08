$(BINDIR)/gdplot3: -lgdplot3 -lgdstream -lgdmap -lsfmap -ldiaglib \
		   -lgemlib -lprmcnvlib -lgridlib -lgemlib -lcgemlib \
		   -lappl -lsyslib -lnetcdf $(PYLIB) \
		   -ltextlib -lxslt -lxml2 -liconv -lbz2 \
	           -lhdf5_hl -lhdf5 -lz -ldl -lm
