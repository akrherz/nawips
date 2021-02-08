$(BINDIR)/gdtser: -lgdtser -ldiaglib -lgemlib -lgridlib \
		  -lgemlib -lcgemlib -lappl -lsyslib -lm \
		  -ltextlib $(PYLIB) -lxslt -lxml2 -liconv -lz
