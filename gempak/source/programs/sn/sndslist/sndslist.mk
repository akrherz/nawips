$(BINDIR)/sndslist: -lsndslist -lsnlib -lgemlib -lprmcnvlib \
		  -lgemlib -lappl -lsyslib \
		  -ltextlib $(PYLIB) -lxslt -lxml2 -liconv -lz
