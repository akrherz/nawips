$(BINDIR)/gdmod: -lgdmod -ldiaglib -lgridlib -lgemlib -lgplt \
		 -ldevice -lgn -lgplt -lcgemlib -lgemlib \
		  -ltextlib -lgridlib $(PYLIB) -lxslt -lxml2 -liconv -lz
