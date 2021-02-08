$(BINDIR)/gdplot2_nc: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o \
		      -lgdplot2 -lgdstream -lgdmap -lsfmap -ldiaglib \
		      -lgemlib -lprmcnvlib -lgridlib -lgplt -ldevice \
		      -lnc -lcgemlib -lgemlib -lgn -lnetcdf $(PYLIB) \
		      -ltextlib -lxslt -lxml2 -liconv -lbz2 \
	              -lhdf5_hl -lhdf5 -lz -ldl -lm
