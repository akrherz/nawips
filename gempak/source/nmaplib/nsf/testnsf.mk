$(BINDIR)/testnsf: -lnmaplib -lsfmap -lsflib -lgemlib -lprmcnvlib \
		   -lgridlib -lappl -lgemlib \
		   -ltextlib -lxslt -lxml2 -liconv $(PYLIB) \
		   -lsyslib -lnetcdf -lbz2 \
                   -lhdf5_hl -lhdf5 -lz -ldl -lm
