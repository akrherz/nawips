$(BINDIR)/snlist: -lsnlist -lsnlib -lgemlib -lprmcnvlib \
		  -lgemlib -lappl -lsyslib $(PYLIB) \
		  -ltextlib $(PYLIB) -lxslt -lxml2 -liconv -lz
