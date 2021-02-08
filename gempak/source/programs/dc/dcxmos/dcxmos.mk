$(BINDIR)/dcxmos: -ldcxmos -lbridge -lprmcnvlib -lsflib -lsnlib -lcgemlib -lgemlib \
		  -ltextlib $(PYLIB) -lxslt -lxml2 -liconv -lz
