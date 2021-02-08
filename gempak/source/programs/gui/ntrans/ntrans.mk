$(BINDIR)/ntrans: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o \
		  -lntrans -lnxmlib -lgemlib -lgplt -ldevice \
		  -lxwp -lxw -lps -lgn -lcgemlib \
		  -lgemlib -lgplt $(XLIBS) \
		  -ltextlib -lxslt -lxml2 -liconv -lz
