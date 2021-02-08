$(BINDIR)/sfgram: -lsfgram -lsflib -lprmcnvlib \
		  -lgemlib -lgridlib -lappl -lsyslib \
		  -ltextlib $(PYLIB) -lxslt -lxml2 -liconv -lz
