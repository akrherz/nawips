$(BINDIR)/nfax: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o \
                -lnfax -lnxmlib -lcgemlib -lgemlib -lgplt -ldevice \
                -lxw -lgn -lgemlib $(XLIBS)
