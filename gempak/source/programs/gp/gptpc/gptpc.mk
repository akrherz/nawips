$(BINDIR)/gptpc: -lgptpc -lcgemlib -lprmcnvlib -lgemlib -lgridlib \
		 -lappl -lgemlib -lsyslib -lnetcdf \
		 -ltextlib -lxslt -lxml2 -liconv -lbz2 \
	         -lhdf5_hl -lhdf5 -lz -ldl -lm
