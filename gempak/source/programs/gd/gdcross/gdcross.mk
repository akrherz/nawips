$(BINDIR)/gdcross: -lgdcross -ldiaglib -lgemlib -lgridlib \
		   -lgemlib -lcgemlib -lappl -lsyslib $(PYLIB) \
		   -ltextlib -lxslt -lxml2 -liconv -lz -lm
