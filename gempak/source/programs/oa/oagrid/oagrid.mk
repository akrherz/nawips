$(BINDIR)/oagrid: -loagrid -lgridlib -lsflib -lsnlib -lgemlib \
		  -lprmcnvlib -lappl -lgemlib -lsyslib \
		  -ltextlib $(PYLIB) -lxslt -lxml2 -liconv -lz
