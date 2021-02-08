$(BINDIR)/namsnd: -lnamsnd -lprmcnvlib -ljwblib -lsflib -lsnlib \
		  -lgemlib -lappl -lsyslib -lncepBUFR \
		  -ltextlib -lgridlib -lgemlib $(PYLIB) \
		  -lxslt -lxml2 -liconv -lz -lm
