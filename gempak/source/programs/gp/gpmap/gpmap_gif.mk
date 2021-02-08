$(BINDIR)/gpmap_gif: $(OS_LIB)/gendp_alt.o $(OS_LIB)/ginitp_alt.o \
		     -lgpmap -lawlib -lcgemlib -lgemlib -lprmcnvlib \
		     -lgridlib -lgplt -ldevice -lcgemlib -lgif \
		     -lgemlib -lgn -lgemlib -lGPC -lnetcdf \
		     -ltextlib -lxslt -lxml2 -liconv -lbz2 \
	             -lhdf5_hl -lhdf5 -lz -ldl -lm
