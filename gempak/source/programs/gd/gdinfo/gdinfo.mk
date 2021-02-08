$(BINDIR)/gdinfo: -lgdinfo -ldiaglib -lgridlib -lgemlib \
		  -lgplt -lgemlib -lcgemlib -ldevice -lgn $(PYLIB) \
		  -ltextlib -lgridlib $(PYLIB) -lxslt -lxml2 -liconv -lz
