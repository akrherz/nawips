$(BINDIR)/testcgr: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o \
		   -lcgemlib -lgemlib -lgplt -ldevice -lnc -lgn \
		   -lcgemlib -lgemlib -lGPC -lm
