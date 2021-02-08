$(BINDIR)/snmap_gif: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o -lsnmap \
		-lsnlib -lprmcnvlib -lgemlib -lgridlib -lcgemlib \
		-lgplt -ldevice -lgif -lgn \
		-lcgemlib -lgridlib -lgemlib \
		-lgplt -ldevice -lgif -lgn \
		-lcgemlib -lgridlib -lgemlib \
		-lprmcnvlib -lgemlib $(PYLIB) \
		-lnetcdf -ltextlib -lxslt -lxml2 -liconv -lbz2 \
	        -lhdf5_hl -lhdf5 -lz -ldl -lm
