$(BINDIR)/build_snap: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o \
		      -lcgemlib -lgemlib -lGPC -lgplt -ldevice \
		      -lgn -lcgemlib -lgemlib -lm
