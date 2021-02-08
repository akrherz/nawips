$(BINDIR)/PS: -ldevice -lps -lgn -lcgemlib -lgemlib \
	      -ltextlib -lxslt -lxml2 -liconv -lappl -lsyslib -lnetcdf -lz -lm -lbz2 \
	      -lhdf5 -lhdf5_hl  \
	      $(OS_LIB)/libhdf5_hl.so
