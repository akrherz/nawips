$(BINDIR)/gdptpdf: -lgdptpdf -ldiaglib -lgemlib -lgridlib \
		   -lappl -lgemlib -lcgemlib -lsyslib -lnetcdf \
		   $(PYLIB) -ltextlib -lxslt -lxml2 -liconv -lz -lm 
