$(BINDIR)/dcmetr: -lbridge -lsflib -lsnlib -lgemlib -lprmcnvlib \
		  -ltextlib -lgemlib $(PYLIB) -lxslt -lxml2 -liconv -lz -lm
