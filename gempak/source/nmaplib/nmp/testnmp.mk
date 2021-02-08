$(BINDIR)/testnmp: -lnmaplib -lgemlib -lgridlib -lcgemlib \
		   -lappl -lgemlib -ltextlib -lxslt -lxml2 -liconv \
		   -lsyslib -lnetcdf -lbz2 \
                   -lhdf5_hl -lhdf5 -lz -ldl -lm
