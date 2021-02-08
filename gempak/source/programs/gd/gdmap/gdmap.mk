$(BINDIR)/gdmap: -lgdmap -ldiaglib -lgemlib -lprmcnvlib -lgridlib -lcgemlib \
		 -lgemlib -lappl -lcgemlib -lsyslib -lnetcdf \
		  -ltextlib $(PYLIB) -lxslt -lxml2 -liconv -lbz2 \
	          -lhdf5_hl -lhdf5 -lz -ldl -lm
