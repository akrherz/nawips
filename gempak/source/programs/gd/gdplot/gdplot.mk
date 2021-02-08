$(BINDIR)/gdplot: -lgdplot -ldiaglib -lgemlib -lprmcnvlib -lgridlib \
		  -lcgemlib -lgemlib -lappl -lsyslib -lnetcdf \
		  -ltextlib $(PYLIB) -lxslt -lxml2 -liconv -lz -lm -lbz2 \
                  -lhdf5 -lhdf5_hl  \
                   $(OS_LIB)/libhdf5_hl.so
