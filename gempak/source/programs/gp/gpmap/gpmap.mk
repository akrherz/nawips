$(BINDIR)/gpmap: -lgpmap -lawlib -lcgemlib -lgemlib -lprmcnvlib \
		 -lgridlib -lappl -lcgemlib -lgemlib -lgplt -lgpltdev \
		 -lsyslib -lGPC -lnetcdf -ldevice -lgn -lxw \
		 -ltextlib -lxslt -lxml2 -liconv -lz -lm -lbz2 \
	         -lhdf5 -lhdf5_hl  \
	         $(OS_LIB)/libhdf5_hl.so
