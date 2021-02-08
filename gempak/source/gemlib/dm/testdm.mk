$(BINDIR)/testdm: -lappl -lgemlib -lsyslib $(PYLIB) \
    		  -lnetcdf -lxml2 -liconv -lz -lm
