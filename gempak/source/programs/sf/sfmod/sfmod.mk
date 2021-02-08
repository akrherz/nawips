$(BINDIR)/sfmod: -lsfmod -lprmcnvlib -lsflib \
		 -lgemlib -lappl -lsyslib \
		 -ltextlib $(PYLIB) -lxslt -lxml2 -liconv -lz
