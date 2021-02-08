$(BINDIR)/gddelt: -lgddelt -ldiaglib -lgridlib -lgemlib \
		  -lcgemlib -lappl -lsyslib \
		  -ltextlib -lgridlib $(PYLIB) -lxslt -lxml2 -liconv -lz
