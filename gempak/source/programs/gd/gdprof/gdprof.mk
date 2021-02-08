$(BINDIR)/gdprof: -lgdprof -lprmcnvlib -ldiaglib -lgemlib \
		  -lgridlib -lcgemlib -lappl -lgemlib -lsyslib -lm \
		  -ltextlib $(PYLIB) -lxslt -lxml2 -liconv -lz
