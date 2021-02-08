$(BINDIR)/gdplot_ps: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o -lgdplot \
		     -ldiaglib -lgemlib -lprmcnvlib -lgridlib -lcgemlib \
		     -lgplt -ldevice -lps -lgn -lcgemlib -lgemlib -lnetcdf \
		     -ltextlib $(PYLIB) -lxslt -lxml2 -liconv -lbz2 \
	             -lhdf5_hl -lhdf5 -lz -ldl -lm
