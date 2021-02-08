$(BINDIR)/gpmap: -lgpmap -lawlib -lcgemlib -lgemlib -lprmcnvlib \
		 -lgridlib -lappl -lcgemlib -lgemlib -lgplt -lgpltdev \
		 -lsyslib -lGPC -lnetcdf -ldevice -lgn -lxw \
		 -ltextlib -lxslt -lxml2 -liconv -lbz2 \
	         -lhdf5_hl -lhdf5 -lz -ldl -lm
