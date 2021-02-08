$(BINDIR)/tpc2shp: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o \
		   -lSHAPE -ltextlib -lcgemlib -lgemlib -lgplt \
		   -lcgemlib -ldevice -lgn -lgemlib -lGPC -lz -lm
