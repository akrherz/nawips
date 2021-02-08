$(BINDIR)/snprof_gif: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o \
		  -lsnprof -lsnlib -lgemlib -lgridlib -lcgemlib \
		  -lprmcnvlib -lgplt -ldevice \
		  -lgif -lgn -lcgemlib -lgemlib \
		  -lgridlib -lgplt -lnetcdf \
		  -ltextlib $(PYLIB) -lxslt -lxml2 -liconv -lz -lm -lbz2
