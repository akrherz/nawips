$(BINDIR)/testlc: -lgemlib -lgridlib -lgemlib -lcgemlib \
		  -ltextlib -lxslt -lxml2 -liconv $(PYLIB) \
		  -lappl -lsyslib -lnetcdf -lbz2 \
	          -lhdf5_hl -lhdf5 -lz -ldl -lm
