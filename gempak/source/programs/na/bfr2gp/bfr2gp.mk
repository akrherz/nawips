$(BINDIR)/bfr2gp: -lbfr2gp -ljwblib -lsflib -lsnlib -lgemlib -lprmcnvlib \
		  -lappl -ltextlib -lgridlib -lgemlib -lsyslib -lncepBUFR \
		  $(PYLIB) -lxslt -lxml2 -liconv -lz
