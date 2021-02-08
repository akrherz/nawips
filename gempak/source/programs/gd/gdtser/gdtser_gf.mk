$(BINDIR)/gdtser_gf: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o -lgdtser \
		      -ldiaglib -lgemlib -lgridlib -lgemlib \
		      -lgplt -ldevice -lgf -lxw \
		      -lgridlib -lgemlib -lcgemlib \
		      -lgn -lcgemlib -lgemlib -lnetcdf $(XLIBS) $(PYLIB) \
		      -ltextlib -lxslt -lxml2 -liconv -lz -lm -lbz2
