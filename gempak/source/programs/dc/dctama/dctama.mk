$(BINDIR)/dctama: -ldctama -lbridge -lsnlib -lgemlib -lprmcnvlib \
		  -lncepBUFR -lncepUT -lncepBUFR \
		  -ltextlib -lgemlib $(PYLIB) -lxslt -lxml2 -liconv -lz -lm
