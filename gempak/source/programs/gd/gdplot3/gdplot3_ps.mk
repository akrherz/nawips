$(BINDIR)/gdplot3_ps: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o \
		      -lgdplot3 -lgdstream -lgdmap -lsfmap -ldiaglib \
		      -lgemlib -lprmcnvlib -lgridlib -lgplt \
		      -ldevice -lps -lgn -lcgemlib -lgemlib -lnetcdf $(PYLIB) \
		      -ltextlib -lxslt -lxml2 -liconv -lz -lm -lbz2 \
	              -lhdf5 -lhdf5_hl  \
	              $(OS_LIB)/libhdf5_hl.so 