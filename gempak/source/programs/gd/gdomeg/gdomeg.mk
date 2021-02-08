$(BINDIR)/gdomeg: -lgdomeg -ldiaglib -lgridlib \
		  -lgemlib -lcgemlib -lappl -lsyslib -lm \
		  -ltextlib -lgridlib $(PYLIB) -lxslt -lxml2 -liconv -lz
