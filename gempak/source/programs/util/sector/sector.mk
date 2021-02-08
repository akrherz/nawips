$(BINDIR)/sector: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o \
		  -lsector -lgemlib -lgridlib -lgplt \
		  -ldevice -lgemlib -lgn
