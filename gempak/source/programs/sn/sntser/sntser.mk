$(BINDIR)/sntser: -lsntser -lsnlib -lgemlib -lgridlib \
		  -lprmcnvlib -lgemlib -lappl -lsyslib \
		  -ltextlib $(PYLIB) -lxslt -lxml2 -liconv -lz
