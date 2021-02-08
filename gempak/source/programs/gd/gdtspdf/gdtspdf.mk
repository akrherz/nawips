$(BINDIR)/gdtspdf: -lgdtspdf -lgdptpdf -lgdthgt -lgdcntr -ldiaglib -lgemlib \
		   -lgridlib -lappl -lgemlib -lcgemlib -lsyslib -lnetcdf \
		   -ltextlib $(PYLIB) -lxslt -lxml2 -liconv -lz -lm 
