$(BINDIR)/aodt: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o \
	   -laodt -lgemlib -lprmcnvlib -lgplt -lgridlib -ldevice \
	   -lAODT_v64 -lAODT_v72 -lxw -lgn -lgemlib \
	   -lcgemlib -lgplt -lgemlib -lnetcdf -lX11 \
	   -ltextlib -lxslt -lxml2 -liconv -lz -lm -lbz2 \
	   -lhdf5 -lhdf5_hl  \
	   $(OS_LIB)/libhdf5_hl.so
