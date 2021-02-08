$(BINDIR)/sfmap_nc: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o \
		    -lsfmap -lprmcnvlib -lsflib -lgemlib \
		    -lgplt -lcgemlib -ldevice -lnc -lgn -lgridlib \
		    -lgplt -lgemlib -lnetcdf $(PYLIB) \
		    -ltextlib $(PYLIB) -lxslt -lxml2 -liconv -lz -lm -lbz2 \
	            -lhdf5 -lhdf5_hl  \
	            $(OS_LIB)/libhdf5_hl.so
