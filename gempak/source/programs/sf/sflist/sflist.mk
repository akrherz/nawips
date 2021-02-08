$(BINDIR)/sflist: -lsflist -lprmcnvlib -lsflib \
		  -lgemlib -lappl -lsyslib $(PYLIB) \
		  -ltextlib $(PYLIB) -lxslt -lxml2 -liconv -lz
