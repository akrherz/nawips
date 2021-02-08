$(BINDIR)/testdp: -lappl -lgemlib -lsyslib -lgridlib -ltextlib \
		  -lcgemlib -lgemlib -ltextlib -lgridlib \
		  -lgemlib -lcgemlib $(PYLIB) \
		  -lnetcdf -lxslt -lxml2 \
		  -liconv -lz -lm
