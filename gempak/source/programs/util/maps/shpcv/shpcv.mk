$(BINDIR)/shpcv: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o \
		 -lshp -lgemlib -lcgemlib -lgplt -ldevice \
		 -lnc -lgn -lcgemlib -lgemlib -lm 
