$(BINDIR)/testtg: -lappl -lgridlib -lgemlib \
		  -ltextlib -lgridlib -lgemlib \
		  -lxslt -lxml2 -liconv $(PYLIB) \
		  -lsyslib -lnetcdf -lz -lm
