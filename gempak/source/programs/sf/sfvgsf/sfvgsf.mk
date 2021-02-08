$(BINDIR)/sfvgsf: -lsfvgsf -lcgemlib -lsflib -lgemlib \
		  -lappl -lsyslib \
		  -ltextlib $(PYLIB) -lxslt -lxml2 -liconv -lz -lm
