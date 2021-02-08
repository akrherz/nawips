$(BINDIR)/mdpspc: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o \
		  -lcgemlib -lgemlib -lgplt -ldevice -lgif -lgn \
		  -lcgemlib -lgemlib -lm
