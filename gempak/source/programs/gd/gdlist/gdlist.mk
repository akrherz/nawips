$(BINDIR)/gdlist: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o -lgdlist \
	          -ldiaglib -lgemlib -lgridlib -lgemlib -lgplt -ldevice \
		  -lgn -lgplt -lcgemlib -lgemlib -lnetcdf \
		  -ltextlib $(PYLIB) -lxslt -lxml2 -liconv -lbz2 \
	          -lhdf5_hl -lhdf5 -lz -ldl -lm
