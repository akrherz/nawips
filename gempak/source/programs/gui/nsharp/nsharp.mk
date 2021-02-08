$(BINDIR)/nsharp: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o -lnsharp \
		  -lsnlist -lsnlib -lsflist -lsflib -lnxmlib -ldiaglib \
		  -lgemlib -lprmcnvlib -lgridlib -lgplt -lcgemlib \
		  -ldevice -lxwp -lxw -lps -lgn -lgemlib -lnetcdf \
		  -ltextlib $(PYLIB) -lxslt -lxml2 -liconv \
		  $(XLIBS) -lbz2 \
	          -lhdf5_hl -lhdf5 -lz -ldl -lm
