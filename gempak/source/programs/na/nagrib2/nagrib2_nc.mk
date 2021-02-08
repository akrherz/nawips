$(BINDIR)/nagrib2_nc: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o \
			-lnagrib2 -lgriblib -ldiaglib -lgridlib -lgemlib \
			-lgplt -ldevice -lnc -lgn \
			-ltextlib -lgemlib -lcgemlib \
			$(PYLIB) -lxslt -lxml2 -liconv -ljasper -lm -lpng -lz
