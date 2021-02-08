$(BINDIR)/grphgd: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o \
		  -lgrphgd -lgdcfil -loabsfc -lprmcnvlib -loalib -lsflib \
		  -ldiaglib -lgridlib -lcgemlib -lgemlib -lgplt -lcgemlib \
		  -ldevice -lgemlib -lgn -lnetcdf \
		  -ltextlib $(PYLIB) -lxslt -lxml2 -liconv -lbz2 \
	          -lhdf5_hl -lhdf5 -lz -ldl -lm
