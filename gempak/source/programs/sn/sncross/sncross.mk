$(BINDIR)/sncross: -lsncross -lsnlib -lgemlib -lprmcnvlib \
		   -lgridlib -lgemlib -lappl -lsyslib \
		   -ltextlib $(PYLIB) -lxslt -lxml2 -liconv -lz
