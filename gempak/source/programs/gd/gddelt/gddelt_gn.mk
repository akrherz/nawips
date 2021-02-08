$(BINDIR)/gddelt_gn: -lgddelt -ldiaglib -lgridlib -lgemlib \
		     -lgplt -ldevice -lgemlib -lcgemlib -lgn \
		     -ltextlib -lgridlib $(PYLIB) -lxslt -lxml2 -liconv -lz
