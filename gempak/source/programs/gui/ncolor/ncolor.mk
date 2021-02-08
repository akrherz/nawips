$(BINDIR)/ncolor: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o \
		  -lnxmlib -lgemlib -lgplt -ldevice -lxwp \
		  -lxw -lps -lgn -lgemlib $(XLIBS) 
