$(BINDIR)/gdstat: $(OS_LIB)/ginitp_alt.o -lgdstat -ldiaglib \
		  -lgemlib -lgridlib -lgemlib -lgplt -ldevice -lgn \
		  -lgplt -lcgemlib -lgemlib -lm \
		  -ltextlib -lgridlib $(PYLIB) -lxslt -lxml2 -liconv -lz
