$(BINDIR)/atest: -lappl -lsyslib -lcgemlib -lgridlib -lgemlib \
		 -ltextlib -lgridlib -lgemlib $(PYLIB) -lxslt -lxml2 -liconv -lz -lm
