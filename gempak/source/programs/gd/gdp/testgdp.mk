$(BINDIR)/testgdp: -lgdplot2 -ldiaglib -lgridlib -lgemlib -lappl \
		   -lgemlib -lcgemlib -lsyslib \
		   -ltextlib -lgridlib -lgemlib \
		   $(PYLIB) -lxslt -lxml2 -liconv -lz
