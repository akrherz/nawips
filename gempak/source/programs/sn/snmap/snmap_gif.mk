$(BINDIR)/snmap_gif: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o -lsnmap \
		-lsnlib -lprmcnvlib -lgemlib -lgridlib -lcgemlib \
		-lgplt -ldevice -lgif -lgn \
		-lcgemlib -lgridlib -lgemlib \
		-lgplt -ldevice -lgif -lgn \
		-lcgemlib -lgridlib -lgemlib \
		-lprmcnvlib -lgemlib $(PYLIB) \
		-lnetcdf -ltextlib -lxslt -lxml2 -liconv -lz -lm -lbz2 \
	        -lhdf5 -lhdf5_hl  \
	        $(OS_LIB)/libhdf5_hl.so
