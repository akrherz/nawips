$(BINDIR)/testairmet: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o \
		      -ltextlib -lcgemlib -lgemlib -lgplt \
		      -ldevice -lgn -lcgemlib -lgemlib -lGPC \
		      -lxslt -lxml2 -liconv -lz -lm
