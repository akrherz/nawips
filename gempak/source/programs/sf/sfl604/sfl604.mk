$(BINDIR)/sfl604: -lsfl604 -lsflib -lprmcnvlib -lgemlib \
		  -lappl -lsyslib \
		  -ltextlib $(PYLIB) -lxslt -lxml2 -liconv -lz
