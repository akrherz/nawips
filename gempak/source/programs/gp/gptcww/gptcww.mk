$(BINDIR)/gptcww: -lgptcww -lcgemlib -lprmcnvlib -lgemlib \
		  -lappl -lgemlib -lgridlib -lsyslib -lnetcdf $(PYLIB) \
		  -ltextlib -lxslt -lxml2 -liconv -lbz2 \
	          -lhdf5_hl -lhdf5 -lz -ldl -lm
