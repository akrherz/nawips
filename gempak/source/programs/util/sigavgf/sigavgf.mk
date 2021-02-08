$(BINDIR)/sigavgf: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o \
		   -lsigavgf -lprmcnvlib -ltextlib -lcgemlib \
		   -lgplt -ldevice -lnc -lgn \
		   -lcgemlib -lgemlib -lm
