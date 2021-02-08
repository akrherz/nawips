$(BINDIR)/vg2uka: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o \
		  -lvg2uka -ltextlib -lprmcnvlib -lcgemlib -lgemlib -lgplt \
		  -ldevice -lcgemlib -lgplt -ldevice \
		  -lnc -lgn -lgemlib -lm
