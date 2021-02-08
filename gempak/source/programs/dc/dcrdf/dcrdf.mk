$(BINDIR)/dcrdf: -lbridge -lsflib -lsnlib -lgemlib \
		  -ltextlib -lgemlib $(PYLIB) -lxslt -lxml2 -liconv -lz -lm
