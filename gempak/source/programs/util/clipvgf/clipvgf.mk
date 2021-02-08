$(BINDIR)/clipvgf: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o \
		   -lcgemlib -lgemlib -lgplt -ldevice -lgn \
		   -lcgemlib -lgemlib -lGPC -lm
