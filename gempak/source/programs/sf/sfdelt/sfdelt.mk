$(BINDIR)/sfdelt: -lsfdelt -lsflib -lgemlib \
		  -lappl -lsyslib \
		  -ltextlib $(PYLIB) -lxslt -lxml2 -liconv -lz