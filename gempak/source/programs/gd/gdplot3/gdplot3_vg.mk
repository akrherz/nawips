$(BINDIR)/gdplot3_vg: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o \
		      -lgdplot3 -lgdstream -lgdmap -lsfmap -ldiaglib \
		      -lgemlib -lprmcnvlib -lgridlib -lgplt \
		      -ldevice -lvg -lgn -lcgemlib -lgemlib -lnetcdf $(PYLIB) \
		      -ltextlib -lxslt -lxml2 -liconv -lbz2 \
	              -lhdf5_hl -lhdf5 -lz -ldl -lm
