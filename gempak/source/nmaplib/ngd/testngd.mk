$(BINDIR)/testngd: -lnmaplib -lgdplot2 -lgdstream -lgdmap -lsfmap \
		   -ldiaglib -lgridlib -lgemlib -lappl \
		   -lgemlib -ltextlib -lgridlib -lgemlib \
		   -lxslt -lxml2 -liconv $(PYLIB) \
		   -lsyslib -lnetcdf -lcgemlib -lz -lm
