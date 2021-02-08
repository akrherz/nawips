$(BINDIR)/nwx: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o -lnwx \
		-lprmcnvlib -lsflib -lsnlib -lnxmlib -lgemlib -lgplt \
		-lgridlib -ldevice -lxwp -lxw -lps -lgn -lcgemlib \
		-lgplt -lgemlib -lm -lnetcdf $(XLIBS) \
		-ltextlib $(PYLIB) -lxslt -lxml2 -liconv -lz -lbz2 \
	        -lhdf5 -lhdf5_hl  \
	        $(OS_LIB)/libhdf5_hl.so 
