$(BINDIR)/testnsn: -lnmaplib -lsnmap -lsnlib -lgemlib -lprmcnvlib \
		   -lgridlib -lappl -lgemlib \
		   -ltextlib -lxslt -lxml2 -liconv $(PYLIB) \
		   -lsyslib -lnetcdf -lbz2 \
		   -lhdf5_hl -lhdf5 -lz -ldl -lm
