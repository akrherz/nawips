$(BINDIR)/snedit: -lsnedit -lprmcnvlib -lsnlib \
		  -lgemlib -lappl -lsyslib \
		  -ltextlib $(PYLIB) -lxslt -lxml2 -liconv -lz
