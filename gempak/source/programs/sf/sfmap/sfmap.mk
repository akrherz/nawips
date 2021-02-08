$(BINDIR)/sfmap: -lsfmap -lprmcnvlib -lsflib -lgemlib \
		 -lcgemlib -lgridlib -lgemlib -lappl $(PYLIB) \
		 -lsyslib -lnetcdf \
		 -ltextlib $(PYLIB) -lxslt -lxml2 -liconv -lbz2 \
	         -lhdf5_hl -lhdf5 -lz -ldl -lm
