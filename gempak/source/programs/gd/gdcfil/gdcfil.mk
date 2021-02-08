$(BINDIR)/gdcfil: $(OS_LIB)/ginitp_alt.o -lgdcfil -lgridlib -lgemlib \
                  -lgplt -ldevice -lgn -lgplt -lcgemlib -lgemlib $(PYLIB) \
		  -ltextlib -lxslt -lxml2 -liconv -lz
