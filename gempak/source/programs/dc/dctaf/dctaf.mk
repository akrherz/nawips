$(BINDIR)/dctaf: -lbridge -lprmcnvlib -lsflib -lsnlib -lgemlib \
		  -ltextlib -lgemlib $(PYLIB) -lxslt -lxml2 -liconv -lz -lm
