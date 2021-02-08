$(BINDIR)/testim: -lgemlib -lprmcnvlib -lgridlib -lappl \
		  -lgemlib -ltextlib -lxslt -lxml2 -liconv -lz \
		  -lsyslib -lnetcdf -lbz2 \
                  -lhdf5_hl -lhdf5 -lz -ldl -lm
