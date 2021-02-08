$(BINDIR)/testshp: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o \
		   -lshp -lcgemlib -lgplt -ldevice -lcgemlib -lnc -lgn -lgemlib -lm
