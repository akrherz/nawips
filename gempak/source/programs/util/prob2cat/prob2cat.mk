$(BINDIR)/prob2cat: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o \
		    -ltextlib -lcgemlib -lgemlib -lgplt -ldevice \
		    -lgn -lcgemlib -lgemlib -lxslt -lxml2 -lGPC -lz -lm
