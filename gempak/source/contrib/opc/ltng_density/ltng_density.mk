$(BINDIR)/ltng_density: -lltng_density -lgemlib -lcgemlib \
		-lappl -lsyslib -lgridlib -lgdmap -lsfmap \
		-lprmcnvlib -lcgemlib -lgemlib -lnetcdf -ldiaglib -lgdstream \
		-lgplt -lgpltdev -ltextlib -lgemlib -lxslt -lnxmlib $(PYLIB) \
		-lxml2 -liconv -lz -lm
