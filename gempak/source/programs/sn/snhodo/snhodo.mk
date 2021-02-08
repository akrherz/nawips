$(BINDIR)/snhodo: -lsnhodo -lsnlib -lgemlib -lprmcnvlib \
		  -lgemlib -lgridlib -lappl -lsyslib \
		  -ltextlib $(PYLIB) -lxslt -lxml2 -liconv -lz
