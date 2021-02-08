$(BINDIR)/snmod: -lsnmod -lsnlib -lgemlib -lprmcnvlib \
		 -lgemlib -lappl -lsyslib \
		  -ltextlib $(PYLIB) -lxslt -lxml2 -liconv -lz
