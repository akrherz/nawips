$(BINDIR)/nagrib: -lnagrib -lgriblib -ldiaglib -lgridlib -lgemlib \
		  -lappl -lsyslib -lcgemlib \
		  -ltextlib \
		  $(PYLIB) -lxslt -lxml2 -liconv -lz -lm
