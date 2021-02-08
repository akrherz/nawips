$(BINDIR)/sfchck: -lsfchck -lsflib -lgemlib \
		  -lappl -lsyslib \
		  -ltextlib $(PYLIB) -lxslt -lxml2 -liconv -lz
