$(BINDIR)/nagrib2: -lnagrib2 -lgriblib -ldiaglib -lgridlib \
		   -lgemlib -lappl -lsyslib -lcgemlib \
		   -ltextlib $(PYLIB) -lxslt -lxml2 -liconv \
		   -ljasper -lm -lpng -lz


