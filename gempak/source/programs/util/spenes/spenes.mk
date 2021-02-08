$(BINDIR)/spenes: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o \
		  -lcgemlib -lgemlib -lgplt -ldevice -lcgemlib \
		  -lgemlib -lgif -lgn -lm
