$(BINDIR)/testgdp3: -lgdplot3 -ldiaglib -lgridlib -lgemlib -lappl \
		    -lgemlib -lcgemlib -lsyslib \
		    -ltextlib -lgridlib -lgemlib \
		    $(PYLIB) -lxslt -lxml2 -liconv -lz
