$(BINDIR)/gpmap_gf: $(OS_LIB)/gendp_alt.o $(OS_LIB)/ginitp_alt.o \
		    -lgpmap -lawlib -lcgemlib -lgemlib -lprmcnvlib \
		    -lgridlib -lgplt -ldevice -lcgemlib -lgf -lxw \
		    -lgemlib -lgn -lgemlib -lGPC -lnetcdf $(XLIBS) \
	 	    -ltextlib -lxslt -lxml2 -liconv -lbz2 \
	            -lhdf5_hl -lhdf5 -lz -ldl -lm
