$(BINDIR)/gdplot2_gf: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o -lgdplot2 \
		      -lgdstream -lgdmap -lsfmap -ldiaglib -lgemlib \
		      -lprmcnvlib -lgridlib -lgplt -ldevice -lgf -lxw \
		      -lgn -lcgemlib -lgemlib -lnetcdf $(XLIBS) $(PYLIB) \
		      -ltextlib -lxslt -lxml2 -liconv -lbz2 \
	              -lhdf5_hl -lhdf5 -lz -ldl -lm
