$(BINDIR)/oabox: -loabox -lgemlib -lgridlib -lcgemlib -lappl -lgemlib \
		 -lcgemlib -lgemlib -lsyslib -lnetcdf \
		 -ltextlib $(PYLIB) -lxslt -lxml2 -liconv -lbz2 \
	         -lhdf5_hl -lhdf5 -lz -ldl -lm
