$(BINDIR)/gdplot3_rbk: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o \
		      -lgdplot3 -lgdstream -lgdmap -lsfmap -ldiaglib \
		      -lgemlib -lprmcnvlib -lgridlib -lgplt \
		      -ldevice -lrbk -lgn -lcgemlib -lgemlib -lnetcdf $(PYLIB) \
		      -ltextlib -lxslt -lxml2 -liconv -lbz2 \
	              -lhdf5_hl -lhdf5 -lz -ldl -lm
