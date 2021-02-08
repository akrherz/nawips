$(BINDIR)/gpanot: -lgpanot -lgemlib -lgridlib -lappl \
		  -lgemlib -ltextlib $(PYLIB) -lxslt -lxml2 -liconv \
		  -lsyslib -lnetcdf -lbz2 \
		  -lhdf5_hl -lhdf5 -lz -ldl -lm
