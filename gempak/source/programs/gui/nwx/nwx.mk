$(BINDIR)/nwx: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o -lnwx \
		-lprmcnvlib -lsflib -lsnlib -lnxmlib -lgemlib -lgplt \
		-lgridlib -ldevice -lxwp -lxw -lps -lgn -lcgemlib \
		-lgplt -lgemlib -lnetcdf $(XLIBS) \
		-ltextlib $(PYLIB) -lxslt -lxml2 -liconv -lbz2 \
	        -lhdf5_hl -lhdf5 -lz -ldl -lm
