$(BINDIR)/snstns: -lsnstns -lsnlib -lgemlib \
		  -lappl -lsyslib \
		  -ltextlib $(PYLIB) -lxslt -lxml2 -liconv -lz
